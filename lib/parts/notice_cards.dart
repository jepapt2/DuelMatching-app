import 'package:cloud_functions/cloud_functions.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'message_cards.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard(
      {Key? key, required this.id, required this.notice, required this.nowTime})
      : super(key: key);
  final String id;
  final Notice notice;
  final DateTime nowTime;

  Widget selectCard() {
    switch (notice.type) {
      case 'friendRequest':
        return FriendRequestNotice(
            id: id,
            recId: notice.recId!,
            recAvatar: notice.recAvatar,
            recName: notice.recName,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!,
            nowTime: nowTime);
      case 'newFriend':
        return NewFriendNotice(
            id: id,
            recId: notice.recId!,
            recAvatar: notice.recAvatar,
            recName: notice.recName,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!,
            nowTime: nowTime);
      case 'createRecruit':
        return CreateRecruitNotice(
            id: id,
            recId: notice.recId!,
            recAvatar: notice.recAvatar,
            recName: notice.recName,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            text: notice.text!,
            updateAt: notice.updateAt!,
            nowTime: nowTime);
      case 'recruitCancel':
        return RecruitCancelNotice(
            id: id,
            recName: notice.recName,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            nowTime: nowTime,
            updateAt: notice.updateAt!);
      default:
        return ErrorNotice(
          updateAt: notice.updateAt,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectCard();
  }
}

class FriendRequestNotice extends HookWidget {
  const FriendRequestNotice(
      {Key? key,
      required this.id,
      required this.recId,
      required this.recName,
      this.recAvatar,
      required this.unReadCount,
      required this.updateAt,
      required this.nowTime})
      : super(key: key);

  final String id;
  final String recId;
  final String recName;
  final String? recAvatar;
  final int unReadCount;
  final DateTime updateAt;
  final DateTime nowTime;

  @override
  Widget build(BuildContext context) {
    //未読かつスクリーン表示中の新規通知を既読に
    if (unReadCount == 1 && nowTime.isBefore(updateAt)) {
      useEffect(() {
        noticeCollection(firebaseCurrentUserId)
            .doc(id)
            .update({'unReadCount': 0});
      }, []);
    }
    return UserWhenConsumer(
        id: firebaseCurrentUserId,
        child: (myProfile) {
          return SubscriberBannerWhenConsumer(
              id: firebaseCurrentUserId,
              child: (isSubscribed) {
                int friendLimit = isSubscribed ? 30 : 10;
                bool friendLimitOver = myProfile.friendCount >= friendLimit;
                return Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              GoRouter.of(context).push('/user/$recId'),
                          child: Stack(children: [
                            AvatarImage(avatar: recAvatar, radius: 25),
                            const Positioned(
                                bottom: 0,
                                right: 0,
                                child: FaIcon(
                                  FontAwesomeIcons.solidEnvelope,
                                  color: Color(0xffff8e3c),
                                  size: 18,
                                ))
                          ]),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            color: Color(0xff2a2a2a),
                                            fontSize: 16),
                                        children: [
                                      TextSpan(
                                        text: recName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(text: 'からフレンド申請が届きました')
                                    ])),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () =>
                                            requestPermissionDialog(
                                                context, friendLimitOver),
                                        child: const Text('承認する')),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    OutlinedButton(
                                        onPressed: () =>
                                            requestRejectionDialog(context),
                                        child: const Text('拒否する'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            if (DateTime(updateAt.year, updateAt.month,
                                    updateAt.day, 0, 0, 0) ==
                                DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                    0,
                                    0,
                                    0))
                              Text(
                                DateFormat('H:mm').format(updateAt),
                                style: const TextStyle(color: Colors.black54),
                              )
                            else
                              Text(
                                DateFormat('M/d').format(updateAt),
                                style: const TextStyle(color: Colors.black54),
                              ),
                          ],
                        )
                      ],
                    )
                  ],
                );
              });
        });
  }

  requestPermissionDialog(BuildContext context, bool friendLimitOver) {
    requestPermission(dialogContext) async {
      Navigator.pop(dialogContext);
      if (friendLimitOver) {
        Fluttertoast.showToast(
            msg: 'フレンド枠がいっぱいです',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      } else {
        try {
          final func = FirebaseFunctions.instanceFor(region: 'asia-northeast1')
              .httpsCallable('friend-onRequestPermission');
          final result = await func
              .call({'recId': recId, 'sendId': firebaseCurrentUserId});
          if (result.data == 'recFriendOver') {
            Fluttertoast.showToast(
                msg: '$recNameのフレンド枠がいっぱいなので登録に失敗しました',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 13.0);
          } else if (result.data == 'sendFriendOver') {
            Fluttertoast.showToast(
                msg: 'フレンド枠がいっぱいです',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 13.0);
          } else if (result.data == 'friendCreate') {
            Fluttertoast.showToast(
                msg: '$recNameとフレンドになりました',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.white,
                fontSize: 13.0);
          }
        } catch (_) {
          Fluttertoast.showToast(
              msg: 'フレンド追加処理に失敗しました',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13.0);
        }
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('フレンド承認'),
                content: Text("$recNameをフレンド登録しますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => requestPermission(dialogContext),
                  ),
                ],
              );
            }));
  }

  requestRejectionDialog(BuildContext context) {
    requestRejection(dialogContext) async {
      Navigator.pop(dialogContext);
      try {
        final func = FirebaseFunctions.instanceFor(region: 'asia-northeast1')
            .httpsCallable('friend-onRequestRejection');
        await func.call({'recId': recId, 'sendId': firebaseCurrentUserId});
        Fluttertoast.showToast(
            msg: '$recNameのフレンド申請を拒否しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: 'フレンド拒否の処理に失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('フレンド申請拒否'),
                content: const Text("フレンド申請を拒否すると通知から削除されます"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => requestRejection(dialogContext),
                  ),
                ],
              );
            }));
  }
}

class NewFriendNotice extends HookWidget {
  const NewFriendNotice(
      {Key? key,
      required this.id,
      required this.recId,
      required this.recName,
      this.recAvatar,
      required this.roomId,
      required this.updateAt,
      required this.unReadCount,
      required this.nowTime})
      : super(key: key);

  final String id;
  final String recId;
  final String recName;
  final String? recAvatar;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;
  final DateTime nowTime;

  @override
  Widget build(BuildContext context) {
    if (unReadCount == 1 && nowTime.isBefore(updateAt)) {
      useEffect(() {
        noticeCollection(firebaseCurrentUserId)
            .doc(id)
            .update({'unReadCount': 0});
      }, []);
    }
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => GoRouter.of(context).push('/user/$recId'),
              child: Stack(children: [
                AvatarImage(avatar: recAvatar, radius: 25),
                const Positioned(
                    bottom: 0,
                    right: 0,
                    child: FaIcon(
                      FontAwesomeIcons.solidHandshake,
                      color: Color(0xffff8e3c),
                      size: 18,
                    ))
              ]),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                color: Color(0xff2a2a2a), fontSize: 16),
                            children: [
                          TextSpan(
                            text: recName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: 'とフレンドになりました')
                        ])),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
                onPressed: () => GoRouter.of(context).push('/chatroom/$roomId'),
                child: const Icon(
                  Icons.message,
                  size: 20.0,
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 36),
                    maximumSize: const Size(40, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 2.0))),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                if (DateTime(
                        updateAt.year, updateAt.month, updateAt.day, 0, 0, 0) ==
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day, 0, 0, 0))
                  Text(
                    DateFormat('H:mm').format(updateAt),
                    style: const TextStyle(color: Colors.black54),
                  )
                else
                  Text(
                    DateFormat('M/d').format(updateAt),
                    style: const TextStyle(color: Colors.black54),
                  ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class CreateRecruitNotice extends HookWidget {
  const CreateRecruitNotice(
      {Key? key,
      required this.id,
      required this.recId,
      required this.recName,
      this.recAvatar,
      required this.roomId,
      required this.updateAt,
      required this.text,
      required this.unReadCount,
      required this.nowTime})
      : super(key: key);

  final String id;
  final String recId;
  final String recName;
  final String? recAvatar;
  final String roomId;
  final String text;
  final int unReadCount;
  final DateTime updateAt;
  final DateTime nowTime;

  @override
  Widget build(BuildContext context) {
    if (unReadCount == 1 && nowTime.isBefore(updateAt)) {
      useEffect(() {
        noticeCollection(firebaseCurrentUserId)
            .doc(id)
            .update({'unReadCount': 0});
      }, []);
    }
    return InkWell(
      onTap: () => GoRouter.of(context).push('/recruit/$roomId'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).push('/user/$recId'),
            child: Stack(children: [
              AvatarImage(avatar: recAvatar, radius: 25),
              const Positioned(
                  bottom: 0,
                  right: 0,
                  child: FaIcon(
                    FontAwesomeIcons.solidFileLines,
                    color: Color(0xffff8e3c),
                    size: 18,
                  ))
            ]),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Color(0xff2a2a2a), fontSize: 16),
                          children: [
                        TextSpan(
                          text: recName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: 'が対戦募集を開始しました')
                      ])),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              if (DateTime(
                      updateAt.year, updateAt.month, updateAt.day, 0, 0, 0) ==
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 0, 0, 0))
                Text(
                  DateFormat('H:mm').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                )
              else
                Text(
                  DateFormat('M/d').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class RecruitCancelNotice extends StatelessWidget {
  const RecruitCancelNotice({
    Key? key,
    required this.id,
    required this.recName,
    required this.roomId,
    required this.updateAt,
    required this.unReadCount,
    required this.nowTime,
  }) : super(key: key);

  final String id;
  final String recName;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;
  final DateTime nowTime;
  @override
  Widget build(BuildContext context) {
    if (unReadCount == 1 && nowTime.isBefore(updateAt)) {
      useEffect(() {
        noticeCollection(firebaseCurrentUserId)
            .doc(id)
            .update({'unReadCount': 0});
      }, []);
    }
    return InkWell(
      onTap: () => GoRouter.of(context).push('/recruit/$roomId'),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.group_off,
                    size: 35.0,
                    color: Color(0xffff8e3c),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Color(0xff2a2a2a), fontSize: 16),
                          children: [
                        TextSpan(
                          text: recName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: 'がキャンセルされました',
                          style: TextStyle(color: Colors.redAccent),
                        )
                      ])),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              if (DateTime(
                      updateAt.year, updateAt.month, updateAt.day, 0, 0, 0) ==
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 0, 0, 0))
                Text(
                  DateFormat('H:mm').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                )
              else
                Text(
                  DateFormat('M/d').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/freezed/request/request.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard(
      {Key? key, required this.id, required this.notice, required this.nowTime})
      : super(key: key);
  final String id;
  final Notice notice;
  final DateTime nowTime;

  Widget selectCard() {
    switch (notice.type) {
      case 'newMessage':
        return NewMessageNotice(
            id: id,
            text: notice.text!,
            recId: notice.recId!,
            recName: notice.recName,
            recAvatar: notice.recAvatar,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!);
      case 'newGroupMessage':
        return NewGroupMessageNotice(
            id: id,
            text: notice.text!,
            recName: notice.recName,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!);
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

class NewMessageNotice extends StatelessWidget {
  const NewMessageNotice({
    Key? key,
    required this.id,
    required this.text,
    required this.recId,
    required this.recName,
    this.recAvatar,
    required this.roomId,
    required this.unReadCount,
    required this.updateAt,
  }) : super(key: key);

  final String id;
  final String text;
  final String recId;
  final String recName;
  final String? recAvatar;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/chatroom/$roomId'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () => GoRouter.of(context).push('/user/$recId'),
              child: AvatarImage(avatar: recAvatar, radius: 25)),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
              Visibility(
                  visible: unReadCount > 0,
                  child: Chip(
                    label: Text(
                      unReadCount > 99 ? '99+' : unReadCount.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                    visualDensity:
                        const VisualDensity(horizontal: 0.0, vertical: -4),

                    // const
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class NewGroupMessageNotice extends StatelessWidget {
  const NewGroupMessageNotice({
    Key? key,
    required this.id,
    required this.text,
    required this.recName,
    required this.roomId,
    required this.unReadCount,
    required this.updateAt,
  }) : super(key: key);

  final String id;
  final String text;
  final String recName;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/group/$roomId'),
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
                    Icons.group,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                  if (DateTime(updateAt.year, updateAt.month, updateAt.day, 0,
                          0, 0) ==
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
                  Visibility(
                    visible: unReadCount > 0,
                    child: const Icon(
                      Icons.circle,
                      size: 18,
                      color: Color(0xffff8e3c),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
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
    if (unReadCount == 1 && nowTime.isBefore(updateAt)) {
      useEffect(() {
        noticeCollection(FirebaseAuth.instance.currentUser!.uid)
            .doc(id)
            .update({'read': true});
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
                            style: const TextStyle(color: Color(0xff2a2a2a)),
                            children: [
                          TextSpan(
                            text: recName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: 'からフレンド申請が届きました')
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () => requestPermissionDialog(context),
                            child: const Text('承認する')),
                        const SizedBox(
                          width: 20.0,
                        ),
                        OutlinedButton(
                            onPressed: () => requestRejectionDialog(context),
                            child: Text('拒否する'))
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

  requestPermissionDialog(BuildContext context) {
    requestPermission() async {
      Navigator.pop(context);
      try {
        await requestDocument(
                '${recId}_${FirebaseAuth.instance.currentUser!.uid}')
            .update({'permission': true});
        Fluttertoast.showToast(
            msg: '$recNameとフレンドになりました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
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

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: const Text('フレンド承認'),
                content: Text("$recNameをフレンド登録しますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => requestPermission(),
                  ),
                ],
              );
            }));
  }

  requestRejectionDialog(BuildContext context) {
    requestRejection() async {
      Navigator.pop(context);
      try {
        await requestDocument(
                '${recId}_${FirebaseAuth.instance.currentUser!.uid}')
            .update({'rejection': true});
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
            builder: (_) {
              return AlertDialog(
                title: const Text('フレンド申請拒否'),
                content: const Text("フレンド申請を拒否すると通知から削除されます"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => requestRejection(),
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
        noticeCollection(FirebaseAuth.instance.currentUser!.uid)
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
                            style: const TextStyle(color: Color(0xff2a2a2a)),
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
        noticeCollection(FirebaseAuth.instance.currentUser!.uid)
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
                          style: const TextStyle(color: Color(0xff2a2a2a)),
                          children: [
                        TextSpan(
                          text: recName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: 'がキャンセルされました',
                          style: const TextStyle(color: Colors.redAccent),
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

class ErrorNotice extends StatelessWidget {
  const ErrorNotice({Key? key, this.updateAt}) : super(key: key);

  final DateTime? updateAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: Icon(
              Icons.error,
              size: 35.0,
              color: Color(0xffff8e3c),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'バージョンが古い、またはエラーのためこの通知は表示できません',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Visibility(
            visible: updateAt != null,
            child: DateTime(updateAt!.year, updateAt!.month, updateAt!.day, 0,
                        0, 0) ==
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day, 0, 0, 0)
                ? Text(
                    DateFormat('H:mm').format(updateAt!),
                    style: const TextStyle(color: Colors.black54),
                  )
                : Text(
                    DateFormat('M/d').format(updateAt!),
                    style: const TextStyle(color: Colors.black54),
                  ))
      ],
    );
  }
}

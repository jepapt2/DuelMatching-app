import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/parts/scroll_detector.dart';
import 'package:duel_matching/parts/systemAvatar.dart';
import 'package:duel_matching/viewmodel/applifecycle_provider.dart';
import 'package:duel_matching/viewmodel/recruit_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class GroupChatScreen extends HookWidget {
  const GroupChatScreen({required this.roomId, Key? key}) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return UserWhenConsumer(
        id: FirebaseAuth.instance.currentUser!.uid,
        child: (myProfile) {
          return RecruitWhenConsumer(
              id: roomId,
              child: (recruit) {
                return MembersWhenConsumer(
                    id: roomId,
                    child: (members) {
                      List<String> membersId =
                          members.map((p) => p.uid).toList();
                      //システムメッセージ用のユーザを作成
                      List<Member> membersWithSystem = [
                        ...members,
                        Member(
                            uid: 'systemMessage',
                            name: 'システムメッセージ',
                            organizer: false,
                            avatar: systemAvatar(),
                            noticeTitle: '')
                      ];

                      useEffect(() {
                        Future.delayed(
                          Duration.zero,
                          () {
                            //グループメンバーではない場合は退出
                            if (!membersId.contains(
                                FirebaseAuth.instance.currentUser!.uid)) {
                              GoRouter.of(context).pop();
                              Fluttertoast.showToast(
                                  msg:
                                      'チャットルームのメンバーではない、\nまたはルームが削除されている可能性があります',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 13.0);
                            }
                          },
                        );
                        return null;
                      }, []);

                      return Consumer(builder: (context, ref, _) {
                        ref.listen<AppLifecycleState>(appLifecycleProvider,
                            (previous, next) async {
                          //アプリが休止状態から再開、かつ自分が部屋に存在している時に実行
                          if (previous == AppLifecycleState.resumed &&
                              previous != next &&
                              membersId.contains(
                                  FirebaseAuth.instance.currentUser!.uid)) {
                            //通知を既読にし、thenで最後に見た時間を保存
                            await noticeCollection(
                                    FirebaseAuth.instance.currentUser!.uid)
                                .doc('${roomId}_newGroupMessage')
                                .update({
                              'unReadCount': 0
                            }).then((doc) => membersCollection(roomId)
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'lastReadAt': DateTime.now()}));
                          }
                        });
                        return WillPopScope(
                          onWillPop: () => _willPopCallback(roomId, membersId),
                          child: Scaffold(
                            appBar: AppBar(
                              title: InkWell(
                                onTap: () => GoRouter.of(context)
                                    .push('/recruit/$roomId'),
                                child: Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(recruit.title),
                                  ),
                                ),
                              ),
                            ),
                            body: Center(
                              child: FirestoreQueryBuilder(
                                query: groupChatCollection(roomId)
                                    .orderBy('createdAt', descending: true),
                                builder: (context,
                                    FirestoreQueryBuilderSnapshot<
                                            FirestoreGroupChatMessage>
                                        snapshot,
                                    _) {
                                  List<ChatMessage> messages =
                                      snapshot.docs.map((message) {
                                    Member member =
                                        membersWithSystem.firstWhere(
                                            (m) =>
                                                m.uid == message.data().userId,
                                            orElse: () => Member(
                                                uid: message.data().userId,
                                                name: '退会したユーザ',
                                                organizer: false,
                                                noticeTitle: ''));
                                    return ChatMessage(
                                        user: ChatUser(
                                            id: message.data().userId,
                                            profileImage: member.avatar,
                                            firstName: member.name),
                                        text: message.data().text,
                                        createdAt: message.data().createdAt ??
                                            DateTime.now());
                                  }).toList();

                                  return ScrollDetector(
                                      threshold: 0.9,
                                      loadNext: () {
                                        if (snapshot.hasMore) {
                                          snapshot.fetchMore();
                                        }
                                      },
                                      builder: (context, controller) {
                                        return DashChat(
                                            messageListOptions:
                                                MessageListOptions(
                                                    scrollController:
                                                        controller,
                                                    dateSeparatorFormat:
                                                        DateFormat('M/d HH:mm'),
                                                    loadEarlierBuilder:
                                                        Container()),
                                            inputOptions: InputOptions(
                                              maxInputLength: 1000,
                                              inputDecoration:
                                                  defaultInputDecoration(
                                                      hintText: 'メッセージを入力',
                                                      fillColor: const Color(
                                                          0xffeff0f3)),
                                            ),
                                            messageOptions: MessageOptions(
                                                avatarBuilder: (user, _, __) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0,
                                                            bottom: 4.0,
                                                            right: 4.0,
                                                            left: 8.0),
                                                    child: AvatarImage(
                                                      avatar: user.profileImage,
                                                      radius: 18.0,
                                                    ),
                                                  );
                                                },
                                                containerColor:
                                                    const Color(0xffeff0f3),
                                                currentUserContainerColor:
                                                    const Color(0xffff8e3c),
                                                messageDecorationBuilder:
                                                    (message, _, __) {
                                                  if (message.user.id ==
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid) {
                                                    return const BoxDecoration(
                                                        color:
                                                            Color(0xffff8e3c),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)));
                                                  } else {
                                                    return const BoxDecoration(
                                                        color:
                                                            Color(0xffeff0f3),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)));
                                                  }
                                                },
                                                onPressAvatar: (user) {
                                                  if (user.id !=
                                                      'systemMessage') {
                                                    GoRouter.of(context).push(
                                                        '/user/${user.id}');
                                                  }
                                                },
                                                showOtherUsersAvatar: true,
                                                showOtherUsersName: true),
                                            currentUser: ChatUser(
                                              id: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            ),
                                            onSend: (message) => onSendMessage(
                                                message, myProfile, roomId),
                                            messages: messages);
                                      });
                                },
                              ),
                            ),
                          ),
                        );
                      });
                    });
              });
        });
  }

  onSendMessage(ChatMessage message, Profile myProfile, String roomId) {
    try {
      //チャット送信
      groupChatCollection(roomId).add(FirestoreGroupChatMessage(
          text: message.text,
          userId: FirebaseAuth.instance.currentUser!.uid,
          noticeName: myProfile.name));
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'メッセージの送信に失敗しました',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }

  Future<bool> _willPopCallback(String roomId, List<String> membersId) async {
    //部屋を退出た時かつチャットメンバーの場合実行
    if (membersId.contains(FirebaseAuth.instance.currentUser!.uid)) {
      //通知を既読にし、thenで最後に見た時間を保存
      await noticeCollection(FirebaseAuth.instance.currentUser!.uid)
          .doc('${roomId}_newGroupMessage')
          .update({'unReadCount': 0}).then((doc) => membersCollection(roomId)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({'lastReadAt': DateTime.now()}));
    }
    return true;
  }
}

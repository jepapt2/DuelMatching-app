import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:duel_matching/freezed/chat_room/chat_room.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/parts/scroll_detector.dart';
import 'package:duel_matching/viewmodel/partner_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutterfire_ui/firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChatScreen extends HookWidget {
  ChatScreen({required this.roomId, Key? key}) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return PartnersWhenConsumer(
        id: roomId,
        child: (partners) {
          List<String> partnersId = partners.map((p) => p.uid).toList();
          Partner partner = partners
              .where((element) =>
                  element.uid != FirebaseAuth.instance.currentUser!.uid)
              .toList()[0];

          useEffect(() {
            Future.delayed(
              Duration.zero,
              () {
                if (!partnersId
                    .contains(FirebaseAuth.instance.currentUser!.uid)) {
                  GoRouter.of(context).pop();
                  Fluttertoast.showToast(
                      msg: 'チャットルームのメンバーではない、\nまたはルームが削除されている可能性があります',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 13.0);
                }
              },
            );
          }, []);

          return WillPopScope(
            onWillPop: () => _willPopCallback(roomId, partnersId),
            child: Scaffold(
              appBar: AppBar(
                title: GestureDetector(
                    onTap: () =>
                        GoRouter.of(context).push('/user/${partner.uid}'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AvatarImage(
                          avatar: partner.avatar,
                          radius: 20.0,
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(partner.name),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        )
                      ],
                    )),
              ),
              body: FirestoreQueryBuilder(
                query: chatCollection(roomId)
                    .orderBy('createdAt', descending: true),
                builder: (context,
                    FirestoreQueryBuilderSnapshot<FirestoreChatMessage>
                        snapshot,
                    _) {
                  List<ChatMessage> messages = snapshot.docs
                      .map((m) => ChatMessage(
                          user: ChatUser(
                            id: m.data().userId,
                          ),
                          text: m.data().text,
                          createdAt: m.data().createdAt!))
                      .toList();
                  return ScrollDetector(
                      threshold: 0.9,
                      loadNext: () {
                        if (snapshot.hasMore) {
                          snapshot.fetchMore();
                        }
                      },
                      builder: (context, controller) {
                        return DashChat(
                            messageListOptions: MessageListOptions(
                              scrollController: controller,
                              dateSeparatorFormat: DateFormat('M/d HH:mm'),
                            ),
                            inputOptions: InputOptions(
                              maxInputLength: 1000,
                              inputDecoration: defaultInputDecoration(
                                  hintText: 'メッセージを入力',
                                  fillColor: const Color(0xffeff0f3)),
                            ),
                            messageOptions: MessageOptions(
                              containerColor: const Color(0xffeff0f3),
                              currentUserContainerColor:
                                  const Color(0xffff8e3c),
                              messageDecorationBuilder: (message, _, __) {
                                if (message.user.id ==
                                    FirebaseAuth.instance.currentUser!.uid) {
                                  return const BoxDecoration(
                                      color: Color(0xffff8e3c),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)));
                                } else {
                                  return const BoxDecoration(
                                      color: Color(0xffeff0f3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)));
                                }
                              },
                              showOtherUsersAvatar: false,
                            ),
                            currentUser: ChatUser(
                              id: FirebaseAuth.instance.currentUser!.uid,
                            ),
                            onSend: (message) => onSendMessage(message, roomId),
                            messages: messages);
                      });
                  // List<types.Message> messages = snapshot.docs
                  //     .map((m) => types.TextMessage(
                  //         author: types.User(id: m.data().userId),
                  //         text: m.data().text,
                  //         id: m.id))
                  //     .toList();

                  // return Chat(
                  //   l10n: ChatL10nEn(inputPlaceholder: 'メッセージを入力'),
                  //   onMessageStatusTap: (a, b) => print('tap'),
                  //   theme: DefaultChatTheme(
                  //       primaryColor: Colors.blue,
                  //       inputBorderRadius: BorderRadius.zero),
                  //   messages: messages,
                  //   onSendPressed: (partialText) => onSendMessage(partialText, roomId),
                  //   user: types.User(
                  //     id: FirebaseAuth.instance.currentUser!.uid,
                  //   ),
                  //   onPreviewDataFetched: (_, p) {
                  //     if (snapshot.hasMore) {
                  //       snapshot.fetchMore();
                  //     }
                  //   },
                  // );
                },
              ),
            ),
          );
        });
  }

  onSendMessage(ChatMessage message, String roomId) {
    try {
      chatCollection(roomId).add(FirestoreChatMessage(
          text: message.text,
          userId: FirebaseAuth.instance.currentUser!.uid,
          createdAt: DateTime.now()));
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

  // onSendMessage(types.PartialText partialText, String roomId) {
  //   try {
  //     chatCollection(roomId).add(FirestoreChatMessage(
  //         text: partialText.text,
  //         userId: FirebaseAuth.instance.currentUser!.uid,
  //         createdAt: DateTime.now()));
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //         msg: 'メッセージの送信に失敗しました',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.TOP,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 13.0);
  //   }
  // }

  Future<bool> _willPopCallback(String roomId, List<String> partnersId) async {
    if (partnersId.contains(FirebaseAuth.instance.currentUser!.uid)) {
      await noticeCollection(FirebaseAuth.instance.currentUser!.uid)
          .doc('${roomId}_newMessage')
          .update({'unReadCount': 0});
    }
    return true;
  }
}

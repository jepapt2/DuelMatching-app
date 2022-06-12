import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

class FriendsScreen extends HookConsumerWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserWhenConsumer(
      child: (user) => FriendsWhenConsumer(child: (friends) {
        List<String> friendsId = friends.map((f) => f.uid).toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text('フレンドリスト'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: friends.isNotEmpty
                ? FirestoreListView(
                    query: userCollection()
                        .where(FieldPath.documentId, whereIn: friendsId),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:
                        (context, QueryDocumentSnapshot<Profile> snapshot) {
                      FriendWithId friendProfile = friends.firstWhere(
                          ((element) => element.uid == snapshot.id));
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 2.0),
                            child: InkWell(
                              onTap: () => GoRouter.of(context)
                                  .push('/user/${friendProfile.uid}'),
                              child: Row(
                                children: [
                                  AvatarImage(
                                      avatar: snapshot.data().avatar,
                                      radius: 25),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data().name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Visibility(
                                            visible: snapshot
                                                .data()
                                                .comment
                                                .isNotNullAndNotEmpty,
                                            child: Text(
                                              snapshot.data().comment!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  ElevatedButton(
                                      onPressed: () => GoRouter.of(context).push(
                                          '/chatroom/${friendProfile.friend.chatRoomId}'),
                                      child: const Icon(
                                        Icons.message,
                                        size: 20.0,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(40, 36),
                                          maximumSize: const Size(40, 36),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0))),
                                ],
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                    loadingBuilder: (context) => Center(
                        child: Column(
                      children: const [
                        SizedBox(
                          height: 100.0,
                        ),
                        CircularProgressIndicator(),
                      ],
                    )),
                    errorBuilder: (context, error, _) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 100.0,
                          ),
                          const Text('ユーザの取得に失敗しました'),
                          ElevatedButton(
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                            child: const Text('更新する'),
                            onPressed: () {
                              GoRouter.of(context).pop();
                              GoRouter.of(context).push('/friends');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(child: Text('まだフレンドはいません')),
          ),
        );
      }),
    );
  }
}

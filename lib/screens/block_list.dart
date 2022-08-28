import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlockListScreen extends HookConsumerWidget {
  const BlockListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size _screenSize = MediaQuery.of(context).size;
    return UserWhenConsumer(
      child: (user) => FriendsWhenConsumer(child: (friends) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ブロックリスト'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: user.blockList != null && user.blockList!.isNotEmpty
                ? FirestoreListView(
                    query: userCollection()
                        .where(FieldPath.documentId, whereIn: user.blockList),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:
                        (context, QueryDocumentSnapshot<Profile> snapshot) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 2.0),
                            child: Row(
                              children: [
                                AvatarImage(
                                    avatar: snapshot.data().avatar, radius: 25),
                                const SizedBox(width: 10.0),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: _screenSize.width * 0.65),
                                  child: Text(
                                    snapshot.data().name,
                                    style: const TextStyle(
                                        color: Color(0xff2a2a2a),
                                        fontSize: 17.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                blockButton(snapshot.id, user.blockList!)
                              ],
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
                              GoRouter.of(context).push('/block');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(child: Text('ブロックしているユーザはいません')),
          ),
        );
      }),
    );
  }

  Widget blockButton(String id, List<String> blockList) {
    return OutlinedButton(
        onPressed: () =>
            userDocument(FirebaseAuth.instance.currentUser!.uid).update({
              'blockList': FieldValue.arrayRemove([id])
            }),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.redAccent),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.redAccent))),
        child: const Text('解除'));
  }
}

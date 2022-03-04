import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendsWhenConsumer extends HookConsumerWidget {
  const FriendsWhenConsumer({Key? key, required this.child}) : super(key: key);

  final Widget Function(List<FriendWithId>) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile =
        ref.watch(userProfileProvider(FirebaseAuth.instance.currentUser!.uid));
    final friends = userProfile.friends;

    return friends!.when(
        data: (friends) => child(friends),
        error: (error, stack) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('アカウント情報の取得に失敗しました'),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      child: const Text('更新する'),
                      onPressed: () {
                        ref.refresh(userProfileProvider(
                            FirebaseAuth.instance.currentUser!.uid));
                      },
                    ),
                  ],
                ),
              ),
            ),
        loading: () => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ));
  }
}

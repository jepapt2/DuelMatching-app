import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserWhenConsumer extends HookConsumerWidget {
  const UserWhenConsumer({Key? key, required this.child}) : super(key: key);

  final Widget Function(Profile) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile =
        ref.watch(userProfileProvider(FirebaseAuth.instance.currentUser!.uid));
    final profile = userProfile.profile;

    return profile!.when(
        data: (user) => child(user),
        error: (error, stack) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ユーザの取得に失敗しました'),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      child: Text('更新する'),
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

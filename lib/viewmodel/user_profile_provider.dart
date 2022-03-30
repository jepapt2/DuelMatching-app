import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final profileProvider = StreamProvider.family<Profile, String>((ref, id) {
  final document = userDocument(id);
  final snapshot = document.snapshots();
  final doc = snapshot.map((event) => event.data()!);
  return doc;
});

final disposeProfileProvider =
    StreamProvider.family.autoDispose<Profile, String>((ref, id) {
  final document = userDocument(id);
  final snapshot = document.snapshots();
  final doc = snapshot.map((event) => event.data()!);
  return doc;
});

final friendsProvider =
    StreamProvider.family<List<FriendWithId>, String>((ref, id) {
  final document = friendCollection(id);
  final snapshot = document.snapshots().map((event) => event.docs
      .map((e) => FriendWithId(uid: e.id, friend: e.data()))
      .toList());
  return snapshot;
});

final userProfileProvider =
    StateProvider.family<UserProfile, String>((ref, String id) {
  final profile = ref.watch(profileProvider(id));
  final friends = ref.watch(friendsProvider(id));
  return UserProfile(uid: id, profile: profile, friends: friends);
});

class UserWhenConsumer extends HookConsumerWidget {
  const UserWhenConsumer({
    Key? key,
    this.id,
    required this.child,
  }) : super(key: key);

  final String? id;
  final Widget Function(Profile) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(
        userProfileProvider(id ?? FirebaseAuth.instance.currentUser!.uid));
    final profile = userProfile.profile;

    return profile!.when(
        data: (user) => child(user),
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

class FriendsWhenConsumer extends HookConsumerWidget {
  const FriendsWhenConsumer({Key? key, this.id, required this.child})
      : super(key: key);

  final String? id;
  final Widget Function(List<FriendWithId>) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(
        userProfileProvider(id ?? FirebaseAuth.instance.currentUser!.uid));
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

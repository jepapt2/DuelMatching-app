import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StreamProvider.family<Profile, String>((ref, id) {
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

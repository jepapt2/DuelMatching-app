import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StreamProvider.family<Profile, String>((ref, id) {
  final document = getUserDocument(id);
  final snapshot = document.snapshots();
  final doc = snapshot.map((event) => event.data()!);
  return doc;
});

final userProfileProvider =
    StateProvider.family<UserProfile, String>((ref, String id) {
  final a = ref.watch(profileProvider(id));
  return UserProfile(uid: id, profile: a);
});

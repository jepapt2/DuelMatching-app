import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final usersProvider =
    StateProvider.family.autoDispose<Query<Profile>, DateTime>((ref, time) {
  Query<Profile> searchUser =
      userCollection().orderBy('activeAt', descending: true).startAfter([time]);

  return searchUser;
});

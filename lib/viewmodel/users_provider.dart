import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final usersProvider = StateProvider.autoDispose<Query<Profile>>((ref) {
  Query<Profile> searchUser = userCollection().orderBy('activeAt');

  return searchUser;
});

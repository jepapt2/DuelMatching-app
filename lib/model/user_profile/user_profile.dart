import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile(
      {required final String uid,
      @Default(null) AsyncValue<Profile>? profile}) = _UserProfile;

  const UserProfile._();
}

@freezed
class Profile with _$Profile {
  factory Profile({
    required final String name,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

DocumentReference<Profile> getUserDocument(String id) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .withConverter<Profile>(
        fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

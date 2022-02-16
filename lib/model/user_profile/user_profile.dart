import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firestore_ref/firestore_ref.dart';
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
    String? avatar,
    String? header,
    String? comment,
    String? introduction,
    String? favorite,
    List<String>? playTitle,
    String? adress,
    String? activityDay,
    String? activityTime,
    String? age,
    String? sex,
    bool? remoteDuel,
    @TimestampConverter() DateTime? createdAt,
    required final int order,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

DocumentReference<Profile> userDocument(String id) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .withConverter<Profile>(
        fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

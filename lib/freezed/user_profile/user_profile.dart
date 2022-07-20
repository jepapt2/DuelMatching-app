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
      @Default(null) AsyncValue<Profile>? profile,
      @Default(null) AsyncValue<List<FriendWithId>>? friends}) = _UserProfile;

  const UserProfile._();
}

@freezed
class ProfileWithId with _$ProfileWithId {
  factory ProfileWithId(
      {required final String id,
      required final Profile profile}) = _ProfileWithId;

  const ProfileWithId._();
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
    required final int friendCount,
    List<String>? blockList,
    List<String>? noticeToken,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? activeAt,
    required final int order,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class FriendWithId with _$FriendWithId {
  factory FriendWithId({
    required final String uid,
    required final Friend friend,
  }) = _FriendWithId;

  const FriendWithId._();
}

@freezed
class Friend with _$Friend {
  factory Friend({
    required final String name,
    required final String uid,
    required final String chatRoomId,
    String? avatar,
    @TimestampConverter() DateTime? createdAt,
  }) = _Friend;

  const Friend._();

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
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

CollectionReference<Profile> userCollection() {
  return FirebaseFirestore.instance.collection('users').withConverter<Profile>(
        fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

Query<Profile> userCollectionQuery() {
  return FirebaseFirestore.instance
      .collection('users')
      .withConverter<Profile>(
        fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      )
      .orderBy('activeAt');
}

CollectionReference<Friend> friendCollection(String id) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .collection('friends')
      .withConverter<Friend>(
        fromFirestore: (snapshot, _) => Friend.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

import 'package:duel_matching/freezed/chat_room/chat_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  factory Member(
      {required final String uid,
      required final String name,
      String? avatar,
      required final bool organizer,
      List<String>? noticeToken,
      required final String noticeTitle,
      @TimestampConverter() DateTime? createdAt}) = _Member;

  const Member._();

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

CollectionReference<Member> membersCollection(String id) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(id)
      .collection('members')
      .withConverter<Member>(
        fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

Query<Member> membersCollectionGroup() {
  return FirebaseFirestore.instance
      .collectionGroup('members')
      .withConverter<Member>(
        fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

@freezed
class FirestoreGroupChatMessage with _$FirestoreGroupChatMessage {
  factory FirestoreGroupChatMessage(
      {required final String text,
      required final String userId,
      required final String noticeName,
      @TimestampConverter() DateTime? createdAt}) = _FirestoreGroupChatMessage;

  const FirestoreGroupChatMessage._();

  factory FirestoreGroupChatMessage.fromJson(Map<String, dynamic> json) =>
      _$FirestoreGroupChatMessageFromJson(json);
}

CollectionReference<FirestoreGroupChatMessage> groupChatCollection(String id) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(id)
      .collection('chat')
      .withConverter<FirestoreGroupChatMessage>(
        fromFirestore: (snapshot, _) =>
            FirestoreGroupChatMessage.fromJson(snapshot.data()!),
        toFirestore: (model, _) => {
          ...model.copyWith().toJson(),
          if (model.createdAt == null) 'createdAt': FieldValue.serverTimestamp()
        },
      );
}

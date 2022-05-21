import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class FirestoreChatMessage with _$FirestoreChatMessage {
  factory FirestoreChatMessage(
      {required final String text,
      required final String userId,
      @TimestampConverter() DateTime? createdAt}) = _FirestoreChatMessage;

  const FirestoreChatMessage._();

  factory FirestoreChatMessage.fromJson(Map<String, dynamic> json) =>
      _$FirestoreChatMessageFromJson(json);
}

CollectionReference<FirestoreChatMessage> chatCollection(String id) {
  return FirebaseFirestore.instance
      .collection('chatRooms')
      .doc(id)
      .collection('chat')
      .withConverter<FirestoreChatMessage>(
        fromFirestore: (snapshot, _) =>
            FirestoreChatMessage.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

@freezed
class Partner with _$Partner {
  factory Partner(
      {required final String uid,
      required final String name,
      String? avatar,
      @TimestampConverter() DateTime? lastReadAt}) = _Partner;

  const Partner._();

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}

CollectionReference<Partner> partnerCollection(String id) {
  return FirebaseFirestore.instance
      .collection('chatRooms')
      .doc(id)
      .collection('partners')
      .withConverter<Partner>(
        fromFirestore: (snapshot, _) => Partner.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

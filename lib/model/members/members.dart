import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'members.freezed.dart';
part 'members.g.dart';

@freezed
class Members with _$Members {
  factory Members(
      {required final String uid,
      required final String name,
      String? avatar,
      required final bool organizer,
      @TimestampConverter() DateTime? createdAt}) = _Members;

  const Members._();

  factory Members.fromJson(Map<String, dynamic> json) =>
      _$MembersFromJson(json);
}

CollectionReference<Members> membersCollection(String id) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(id)
      .collection('members')
      .withConverter<Members>(
        fromFirestore: (snapshot, _) => Members.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

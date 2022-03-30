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

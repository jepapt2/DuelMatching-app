import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'recruit.freezed.dart';
part 'recruit.g.dart';

@freezed
class RecruitWithId with _$RecruitWithId {
  factory RecruitWithId(
      {required final String id,
      required final Recruit recruit}) = _RecruitWithId;

  const RecruitWithId._();
}

@freezed
class Recruit with _$Recruit {
  factory Recruit({
    required final String title,
    required final String playTitle,
    String? format,
    required final String place,
    required final String point,
    @TimestampConverter() DateTime? start,
    @TimestampConverter() DateTime? end,
    @TimestampConverter() DateTime? limit,
    required final bool friendOnly,
    required final int recruitNumber,
    String? overview,
    required final int memberCount,
    required final bool full,
    required final bool cancel,
    required final bool close,
    int? order,
    required final String organizerId,
    required final List<String> membersId,
    @TimestampConverter() DateTime? createdAt,
  }) = _Recruit;

  const Recruit._();

  factory Recruit.fromJson(Map<String, dynamic> json) =>
      _$RecruitFromJson(json);
}

CollectionReference<Recruit> recruitsCollection() {
  return FirebaseFirestore.instance.collection('groups').withConverter<Recruit>(
        fromFirestore: (snapshot, _) => Recruit.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

DocumentReference<Recruit> recruitDocument(String id) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(id)
      .withConverter<Recruit>(
        fromFirestore: (snapshot, _) => Recruit.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

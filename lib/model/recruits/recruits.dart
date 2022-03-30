import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'recruits.freezed.dart';
part 'recruits.g.dart';

@freezed
class Recruits with _$Recruits {
  factory Recruits({
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
    int? order,
    required final String organizerId,
    @TimestampConverter() DateTime? createdAt,
  }) = _Recruits;

  const Recruits._();

  factory Recruits.fromJson(Map<String, dynamic> json) =>
      _$RecruitsFromJson(json);
}

CollectionReference<Recruits> recruitsCollection() {
  return FirebaseFirestore.instance
      .collection('groups')
      .withConverter<Recruits>(
        fromFirestore: (snapshot, _) => Recruits.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

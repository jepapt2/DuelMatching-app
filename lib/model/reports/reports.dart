import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'reports.freezed.dart';
part 'reports.g.dart';

@freezed
class Reports with _$Reports {
  factory Reports({
    required final String sendId,
    required final String sendName,
    required final String reportId,
    required final String reason,
    String? details,
    String? chat,
    @TimestampConverter() DateTime? createdAt,
  }) = _Reports;

  const Reports._();

  factory Reports.fromJson(Map<String, dynamic> json) =>
      _$ReportsFromJson(json);
}

CollectionReference<Reports> reportsCollection() {
  return FirebaseFirestore.instance
      .collection('reports')
      .withConverter<Reports>(
        fromFirestore: (snapshot, _) => Reports.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  factory Report({
    required final String sendId,
    required final String sendName,
    required final String reportId,
    required final String reason,
    String? details,
    String? chat,
    @TimestampConverter() DateTime? createdAt,
  }) = _Report;

  const Report._();

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

CollectionReference<Report> reportsCollection() {
  return FirebaseFirestore.instance.collection('reports').withConverter<Report>(
        fromFirestore: (snapshot, _) => Report.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

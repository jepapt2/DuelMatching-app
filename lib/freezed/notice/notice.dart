import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  factory Notice(
      {required final String type,
      String? text,
      required final String recName,
      String? recId,
      String? recAvatar,
      String? roomId,
      required final bool read,
      @TimestampConverter() DateTime? updateAt}) = _Notice;

  const Notice._();

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

CollectionReference<Notice> noticeCollection(String id) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .collection('notifications')
      .withConverter<Notice>(
        fromFirestore: (snapshot, _) => Notice.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  factory Request({
    required final String sendId,
    required final String sendName,
    String? sendAvatar,
    required final String recId,
    required final bool permission,
    required final bool rejection,
    @TimestampConverter() DateTime? updateAt,
  }) = _Request;

  const Request._();

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}

DocumentReference<Request> requestDocument(String id) {
  return FirebaseFirestore.instance
      .collection('requests')
      .doc(id)
      .withConverter<Request>(
        fromFirestore: (snapshot, _) => Request.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firestore_ref/firestore_ref.dart';
part 'subscriber.freezed.dart';
part 'subscriber.g.dart';

@freezed
class Subscriber with _$Subscriber {
  factory Subscriber({
    @TimestampConverter() DateTime? canceledAt,
    @TimestampConverter() DateTime? endAt,
    required final String entitlementID,
    required final String method,
    required final String periodType,
    required final String productID,
    required final String status,
    required final String transactionID,
    @TimestampConverter() DateTime? updateAt,
  }) = _Subscriber;

  const Subscriber._();

  factory Subscriber.fromJson(Map<String, dynamic> json) =>
      _$SubscriberFromJson(json);
}

DocumentReference<Subscriber> subscriberDocument(String userId) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('subscriptions')
      .doc('subscriber')
      .withConverter<Subscriber>(
        fromFirestore: (snapshot, _) => Subscriber.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
}


// final subscriptionRef = FirebaseFirestore.instance.collection('users').doc('my userID').collection('subscriptions').doc('entitlementID');


// subscriptionRef.snapshots().listen((snapshot) {
//   // snapshot.data()にデータが格納されているので、各自の環境に応じてハンドリングします
//   // 渡しの場合はfreezedを使ってモデルを生成しているので、fromJsonでデコードしています
//   final subscription = snapshot.data() == null ? null : Subscription.fromJson(snapshot.data());
// }, onError: print);

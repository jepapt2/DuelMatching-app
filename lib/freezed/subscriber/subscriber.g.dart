// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subscriber _$$_SubscriberFromJson(Map<String, dynamic> json) =>
    _$_Subscriber(
      canceledAt:
          const TimestampConverter().fromJson(json['canceledAt'] as Timestamp?),
      endAt: const TimestampConverter().fromJson(json['endAt'] as Timestamp?),
      entitlementID: json['entitlementID'] as String,
      method: json['method'] as String,
      periodType: json['periodType'] as String,
      productID: json['productID'] as String,
      status: json['status'] as String,
      transactionID: json['transactionID'] as String,
      updateAt:
          const TimestampConverter().fromJson(json['updateAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_SubscriberToJson(_$_Subscriber instance) =>
    <String, dynamic>{
      'canceledAt': const TimestampConverter().toJson(instance.canceledAt),
      'endAt': const TimestampConverter().toJson(instance.endAt),
      'entitlementID': instance.entitlementID,
      'method': instance.method,
      'periodType': instance.periodType,
      'productID': instance.productID,
      'status': instance.status,
      'transactionID': instance.transactionID,
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reports _$$_ReportsFromJson(Map<String, dynamic> json) => _$_Reports(
      sendId: json['sendId'] as String,
      sendName: json['sendName'] as String,
      reportId: json['reportId'] as String,
      reason: json['reason'] as String,
      details: json['details'] as String?,
      chat: json['chat'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_ReportsToJson(_$_Reports instance) =>
    <String, dynamic>{
      'sendId': instance.sendId,
      'sendName': instance.sendName,
      'reportId': instance.reportId,
      'reason': instance.reason,
      'details': instance.details,
      'chat': instance.chat,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

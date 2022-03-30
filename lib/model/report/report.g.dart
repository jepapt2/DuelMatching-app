// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      sendId: json['sendId'] as String,
      sendName: json['sendName'] as String,
      reportId: json['reportId'] as String,
      reason: json['reason'] as String,
      details: json['details'] as String?,
      chat: json['chat'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'sendId': instance.sendId,
      'sendName': instance.sendName,
      'reportId': instance.reportId,
      'reason': instance.reason,
      'details': instance.details,
      'chat': instance.chat,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

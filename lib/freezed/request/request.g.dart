// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      sendId: json['sendId'] as String,
      sendName: json['sendName'] as String,
      sendAvatar: json['sendAvatar'] as String?,
      recId: json['recId'] as String,
      permission: json['permission'] as bool,
      rejection: json['rejection'] as bool,
      updateAt:
          const TimestampConverter().fromJson(json['updateAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'sendId': instance.sendId,
      'sendName': instance.sendName,
      'sendAvatar': instance.sendAvatar,
      'recId': instance.recId,
      'permission': instance.permission,
      'rejection': instance.rejection,
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
    };

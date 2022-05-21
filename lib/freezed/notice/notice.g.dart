// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notice _$$_NoticeFromJson(Map<String, dynamic> json) => _$_Notice(
      type: json['type'] as String,
      text: json['text'] as String?,
      recName: json['recName'] as String,
      recId: json['recId'] as String?,
      recAvatar: json['recAvatar'] as String?,
      roomId: json['roomId'] as String?,
      unReadCount: json['unReadCount'] as int,
      updateAt:
          const TimestampConverter().fromJson(json['updateAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_NoticeToJson(_$_Notice instance) => <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'recName': instance.recName,
      'recId': instance.recId,
      'recAvatar': instance.recAvatar,
      'roomId': instance.roomId,
      'unReadCount': instance.unReadCount,
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
    };

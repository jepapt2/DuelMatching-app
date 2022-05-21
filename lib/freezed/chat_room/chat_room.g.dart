// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreChatMessage _$$_FirestoreChatMessageFromJson(
        Map<String, dynamic> json) =>
    _$_FirestoreChatMessage(
      text: json['text'] as String,
      userId: json['userId'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_FirestoreChatMessageToJson(
        _$_FirestoreChatMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'userId': instance.userId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

_$_Partner _$$_PartnerFromJson(Map<String, dynamic> json) => _$_Partner(
      uid: json['uid'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      lastReadAt:
          const TimestampConverter().fromJson(json['lastReadAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PartnerToJson(_$_Partner instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
      'lastReadAt': const TimestampConverter().toJson(instance.lastReadAt),
    };

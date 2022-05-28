// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      uid: json['uid'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      organizer: json['organizer'] as bool,
      noticeToken: (json['noticeToken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      noticeTitle: json['noticeTitle'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
      'organizer': instance.organizer,
      'noticeToken': instance.noticeToken,
      'noticeTitle': instance.noticeTitle,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

_$_FirestoreGroupChatMessage _$$_FirestoreGroupChatMessageFromJson(
        Map<String, dynamic> json) =>
    _$_FirestoreGroupChatMessage(
      text: json['text'] as String,
      userId: json['userId'] as String,
      noticeName: json['noticeName'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_FirestoreGroupChatMessageToJson(
        _$_FirestoreGroupChatMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'userId': instance.userId,
      'noticeName': instance.noticeName,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

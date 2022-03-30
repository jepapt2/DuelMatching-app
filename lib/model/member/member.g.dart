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
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
      'organizer': instance.organizer,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

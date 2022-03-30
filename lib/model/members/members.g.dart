// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Members _$$_MembersFromJson(Map<String, dynamic> json) => _$_Members(
      uid: json['uid'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      organizer: json['organizer'] as bool,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_MembersToJson(_$_Members instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
      'organizer': instance.organizer,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

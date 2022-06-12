// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recruit _$$_RecruitFromJson(Map<String, dynamic> json) => _$_Recruit(
      title: json['title'] as String,
      playTitle: json['playTitle'] as String,
      format: json['format'] as String?,
      place: json['place'] as String,
      point: json['point'] as String,
      start: const TimestampConverter().fromJson(json['start'] as Timestamp?),
      end: const TimestampConverter().fromJson(json['end'] as Timestamp?),
      limit: const TimestampConverter().fromJson(json['limit'] as Timestamp?),
      friendOnly: json['friendOnly'] as bool,
      recruitNumber: json['recruitNumber'] as int,
      overview: json['overview'] as String?,
      memberCount: json['memberCount'] as int,
      full: json['full'] as bool,
      cancel: json['cancel'] as bool,
      close: json['close'] as bool,
      order: json['order'] as int?,
      organizerId: json['organizerId'] as String,
      membersId:
          (json['membersId'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_RecruitToJson(_$_Recruit instance) =>
    <String, dynamic>{
      'title': instance.title,
      'playTitle': instance.playTitle,
      'format': instance.format,
      'place': instance.place,
      'point': instance.point,
      'start': const TimestampConverter().toJson(instance.start),
      'end': const TimestampConverter().toJson(instance.end),
      'limit': const TimestampConverter().toJson(instance.limit),
      'friendOnly': instance.friendOnly,
      'recruitNumber': instance.recruitNumber,
      'overview': instance.overview,
      'memberCount': instance.memberCount,
      'full': instance.full,
      'cancel': instance.cancel,
      'close': instance.close,
      'order': instance.order,
      'organizerId': instance.organizerId,
      'membersId': instance.membersId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

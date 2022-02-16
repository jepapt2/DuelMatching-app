// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      header: json['header'] as String?,
      comment: json['comment'] as String?,
      introduction: json['introduction'] as String?,
      favorite: json['favorite'] as String?,
      playTitle: (json['playTitle'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adress: json['adress'] as String?,
      activityDay: json['activityDay'] as String?,
      activityTime: json['activityTime'] as String?,
      age: json['age'] as String?,
      sex: json['sex'] as String?,
      remoteDuel: json['remoteDuel'] as bool?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      order: json['order'] as int,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'header': instance.header,
      'comment': instance.comment,
      'introduction': instance.introduction,
      'favorite': instance.favorite,
      'playTitle': instance.playTitle,
      'adress': instance.adress,
      'activityDay': instance.activityDay,
      'activityTime': instance.activityTime,
      'age': instance.age,
      'sex': instance.sex,
      'remoteDuel': instance.remoteDuel,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'order': instance.order,
    };

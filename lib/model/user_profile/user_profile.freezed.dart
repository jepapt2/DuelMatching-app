// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call(
      {required String uid, AsyncValue<Profile>? profile = null}) {
    return _UserProfile(
      uid: uid,
      profile: profile,
    );
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  String get uid => throw _privateConstructorUsedError;
  AsyncValue<Profile>? get profile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call({String uid, AsyncValue<Profile>? profile});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Profile>?,
    ));
  }
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
  @override
  $Res call({String uid, AsyncValue<Profile>? profile});
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;

  @override
  $Res call({
    Object? uid = freezed,
    Object? profile = freezed,
  }) {
    return _then(_UserProfile(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Profile>?,
    ));
  }
}

/// @nodoc

class _$_UserProfile extends _UserProfile {
  _$_UserProfile({required this.uid, this.profile = null}) : super._();

  @override
  final String uid;
  @JsonKey()
  @override
  final AsyncValue<Profile>? profile;

  @override
  String toString() {
    return 'UserProfile(uid: $uid, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(profile));

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);
}

abstract class _UserProfile extends UserProfile {
  factory _UserProfile({required String uid, AsyncValue<Profile>? profile}) =
      _$_UserProfile;
  _UserProfile._() : super._();

  @override
  String get uid;
  @override
  AsyncValue<Profile>? get profile;
  @override
  @JsonKey(ignore: true)
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

  _Profile call(
      {required String name,
      String? avatar,
      String? header,
      String? comment,
      String? introduction,
      String? favorite,
      List<String>? playTitle,
      String? adress,
      String? activityDay,
      String? activityTime,
      String? age,
      String? sex,
      bool? remoteDuel,
      @TimestampConverter() DateTime? createdAt,
      required int order}) {
    return _Profile(
      name: name,
      avatar: avatar,
      header: header,
      comment: comment,
      introduction: introduction,
      favorite: favorite,
      playTitle: playTitle,
      adress: adress,
      activityDay: activityDay,
      activityTime: activityTime,
      age: age,
      sex: sex,
      remoteDuel: remoteDuel,
      createdAt: createdAt,
      order: order,
    );
  }

  Profile fromJson(Map<String, Object?> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get header => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  String? get favorite => throw _privateConstructorUsedError;
  List<String>? get playTitle => throw _privateConstructorUsedError;
  String? get adress => throw _privateConstructorUsedError;
  String? get activityDay => throw _privateConstructorUsedError;
  String? get activityTime => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get sex => throw _privateConstructorUsedError;
  bool? get remoteDuel => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? avatar,
      String? header,
      String? comment,
      String? introduction,
      String? favorite,
      List<String>? playTitle,
      String? adress,
      String? activityDay,
      String? activityTime,
      String? age,
      String? sex,
      bool? remoteDuel,
      @TimestampConverter() DateTime? createdAt,
      int order});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatar = freezed,
    Object? header = freezed,
    Object? comment = freezed,
    Object? introduction = freezed,
    Object? favorite = freezed,
    Object? playTitle = freezed,
    Object? adress = freezed,
    Object? activityDay = freezed,
    Object? activityTime = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? remoteDuel = freezed,
    Object? createdAt = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: favorite == freezed
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as String?,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDay: activityDay == freezed
          ? _value.activityDay
          : activityDay // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTime: activityTime == freezed
          ? _value.activityTime
          : activityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteDuel: remoteDuel == freezed
          ? _value.remoteDuel
          : remoteDuel // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? avatar,
      String? header,
      String? comment,
      String? introduction,
      String? favorite,
      List<String>? playTitle,
      String? adress,
      String? activityDay,
      String? activityTime,
      String? age,
      String? sex,
      bool? remoteDuel,
      @TimestampConverter() DateTime? createdAt,
      int order});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatar = freezed,
    Object? header = freezed,
    Object? comment = freezed,
    Object? introduction = freezed,
    Object? favorite = freezed,
    Object? playTitle = freezed,
    Object? adress = freezed,
    Object? activityDay = freezed,
    Object? activityTime = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? remoteDuel = freezed,
    Object? createdAt = freezed,
    Object? order = freezed,
  }) {
    return _then(_Profile(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: favorite == freezed
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as String?,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDay: activityDay == freezed
          ? _value.activityDay
          : activityDay // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTime: activityTime == freezed
          ? _value.activityTime
          : activityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteDuel: remoteDuel == freezed
          ? _value.remoteDuel
          : remoteDuel // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile extends _Profile {
  _$_Profile(
      {required this.name,
      this.avatar,
      this.header,
      this.comment,
      this.introduction,
      this.favorite,
      this.playTitle,
      this.adress,
      this.activityDay,
      this.activityTime,
      this.age,
      this.sex,
      this.remoteDuel,
      @TimestampConverter() this.createdAt,
      required this.order})
      : super._();

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String name;
  @override
  final String? avatar;
  @override
  final String? header;
  @override
  final String? comment;
  @override
  final String? introduction;
  @override
  final String? favorite;
  @override
  final List<String>? playTitle;
  @override
  final String? adress;
  @override
  final String? activityDay;
  @override
  final String? activityTime;
  @override
  final String? age;
  @override
  final String? sex;
  @override
  final bool? remoteDuel;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final int order;

  @override
  String toString() {
    return 'Profile(name: $name, avatar: $avatar, header: $header, comment: $comment, introduction: $introduction, favorite: $favorite, playTitle: $playTitle, adress: $adress, activityDay: $activityDay, activityTime: $activityTime, age: $age, sex: $sex, remoteDuel: $remoteDuel, createdAt: $createdAt, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.header, header) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality().equals(other.favorite, favorite) &&
            const DeepCollectionEquality().equals(other.playTitle, playTitle) &&
            const DeepCollectionEquality().equals(other.adress, adress) &&
            const DeepCollectionEquality()
                .equals(other.activityDay, activityDay) &&
            const DeepCollectionEquality()
                .equals(other.activityTime, activityTime) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality()
                .equals(other.remoteDuel, remoteDuel) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.order, order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(header),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(favorite),
      const DeepCollectionEquality().hash(playTitle),
      const DeepCollectionEquality().hash(adress),
      const DeepCollectionEquality().hash(activityDay),
      const DeepCollectionEquality().hash(activityTime),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(sex),
      const DeepCollectionEquality().hash(remoteDuel),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(order));

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(this);
  }
}

abstract class _Profile extends Profile {
  factory _Profile(
      {required String name,
      String? avatar,
      String? header,
      String? comment,
      String? introduction,
      String? favorite,
      List<String>? playTitle,
      String? adress,
      String? activityDay,
      String? activityTime,
      String? age,
      String? sex,
      bool? remoteDuel,
      @TimestampConverter() DateTime? createdAt,
      required int order}) = _$_Profile;
  _Profile._() : super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String get name;
  @override
  String? get avatar;
  @override
  String? get header;
  @override
  String? get comment;
  @override
  String? get introduction;
  @override
  String? get favorite;
  @override
  List<String>? get playTitle;
  @override
  String? get adress;
  @override
  String? get activityDay;
  @override
  String? get activityTime;
  @override
  String? get age;
  @override
  String? get sex;
  @override
  bool? get remoteDuel;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

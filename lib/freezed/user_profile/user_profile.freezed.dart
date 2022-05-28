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
      {required String uid,
      AsyncValue<Profile>? profile = null,
      AsyncValue<List<FriendWithId>>? friends = null}) {
    return _UserProfile(
      uid: uid,
      profile: profile,
      friends: friends,
    );
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  String get uid => throw _privateConstructorUsedError;
  AsyncValue<Profile>? get profile => throw _privateConstructorUsedError;
  AsyncValue<List<FriendWithId>>? get friends =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      AsyncValue<Profile>? profile,
      AsyncValue<List<FriendWithId>>? friends});
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
    Object? friends = freezed,
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
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FriendWithId>>?,
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
  $Res call(
      {String uid,
      AsyncValue<Profile>? profile,
      AsyncValue<List<FriendWithId>>? friends});
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
    Object? friends = freezed,
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
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FriendWithId>>?,
    ));
  }
}

/// @nodoc

class _$_UserProfile extends _UserProfile {
  _$_UserProfile({required this.uid, this.profile = null, this.friends = null})
      : super._();

  @override
  final String uid;
  @JsonKey()
  @override
  final AsyncValue<Profile>? profile;
  @JsonKey()
  @override
  final AsyncValue<List<FriendWithId>>? friends;

  @override
  String toString() {
    return 'UserProfile(uid: $uid, profile: $profile, friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality().equals(other.friends, friends));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(friends));

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);
}

abstract class _UserProfile extends UserProfile {
  factory _UserProfile(
      {required String uid,
      AsyncValue<Profile>? profile,
      AsyncValue<List<FriendWithId>>? friends}) = _$_UserProfile;
  _UserProfile._() : super._();

  @override
  String get uid;
  @override
  AsyncValue<Profile>? get profile;
  @override
  AsyncValue<List<FriendWithId>>? get friends;
  @override
  @JsonKey(ignore: true)
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProfileWithIdTearOff {
  const _$ProfileWithIdTearOff();

  _ProfileWithId call({required String id, required Profile profile}) {
    return _ProfileWithId(
      id: id,
      profile: profile,
    );
  }
}

/// @nodoc
const $ProfileWithId = _$ProfileWithIdTearOff();

/// @nodoc
mixin _$ProfileWithId {
  String get id => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileWithIdCopyWith<ProfileWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileWithIdCopyWith<$Res> {
  factory $ProfileWithIdCopyWith(
          ProfileWithId value, $Res Function(ProfileWithId) then) =
      _$ProfileWithIdCopyWithImpl<$Res>;
  $Res call({String id, Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileWithIdCopyWithImpl<$Res>
    implements $ProfileWithIdCopyWith<$Res> {
  _$ProfileWithIdCopyWithImpl(this._value, this._then);

  final ProfileWithId _value;
  // ignore: unused_field
  final $Res Function(ProfileWithId) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  @override
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileWithIdCopyWith<$Res>
    implements $ProfileWithIdCopyWith<$Res> {
  factory _$ProfileWithIdCopyWith(
          _ProfileWithId value, $Res Function(_ProfileWithId) then) =
      __$ProfileWithIdCopyWithImpl<$Res>;
  @override
  $Res call({String id, Profile profile});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$ProfileWithIdCopyWithImpl<$Res>
    extends _$ProfileWithIdCopyWithImpl<$Res>
    implements _$ProfileWithIdCopyWith<$Res> {
  __$ProfileWithIdCopyWithImpl(
      _ProfileWithId _value, $Res Function(_ProfileWithId) _then)
      : super(_value, (v) => _then(v as _ProfileWithId));

  @override
  _ProfileWithId get _value => super._value as _ProfileWithId;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
  }) {
    return _then(_ProfileWithId(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc

class _$_ProfileWithId extends _ProfileWithId {
  _$_ProfileWithId({required this.id, required this.profile}) : super._();

  @override
  final String id;
  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileWithId(id: $id, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileWithId &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(profile));

  @JsonKey(ignore: true)
  @override
  _$ProfileWithIdCopyWith<_ProfileWithId> get copyWith =>
      __$ProfileWithIdCopyWithImpl<_ProfileWithId>(this, _$identity);
}

abstract class _ProfileWithId extends ProfileWithId {
  factory _ProfileWithId({required String id, required Profile profile}) =
      _$_ProfileWithId;
  _ProfileWithId._() : super._();

  @override
  String get id;
  @override
  Profile get profile;
  @override
  @JsonKey(ignore: true)
  _$ProfileWithIdCopyWith<_ProfileWithId> get copyWith =>
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
      List<String>? blockList,
      List<String>? noticeToken,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? activeAt,
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
      blockList: blockList,
      noticeToken: noticeToken,
      createdAt: createdAt,
      activeAt: activeAt,
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
  List<String>? get blockList => throw _privateConstructorUsedError;
  List<String>? get noticeToken => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get activeAt => throw _privateConstructorUsedError;
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
      List<String>? blockList,
      List<String>? noticeToken,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? activeAt,
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
    Object? blockList = freezed,
    Object? noticeToken = freezed,
    Object? createdAt = freezed,
    Object? activeAt = freezed,
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
      blockList: blockList == freezed
          ? _value.blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noticeToken: noticeToken == freezed
          ? _value.noticeToken
          : noticeToken // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeAt: activeAt == freezed
          ? _value.activeAt
          : activeAt // ignore: cast_nullable_to_non_nullable
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
      List<String>? blockList,
      List<String>? noticeToken,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? activeAt,
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
    Object? blockList = freezed,
    Object? noticeToken = freezed,
    Object? createdAt = freezed,
    Object? activeAt = freezed,
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
      blockList: blockList == freezed
          ? _value.blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noticeToken: noticeToken == freezed
          ? _value.noticeToken
          : noticeToken // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeAt: activeAt == freezed
          ? _value.activeAt
          : activeAt // ignore: cast_nullable_to_non_nullable
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
      this.blockList,
      this.noticeToken,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.activeAt,
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
  final List<String>? blockList;
  @override
  final List<String>? noticeToken;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? activeAt;
  @override
  final int order;

  @override
  String toString() {
    return 'Profile(name: $name, avatar: $avatar, header: $header, comment: $comment, introduction: $introduction, favorite: $favorite, playTitle: $playTitle, adress: $adress, activityDay: $activityDay, activityTime: $activityTime, age: $age, sex: $sex, remoteDuel: $remoteDuel, blockList: $blockList, noticeToken: $noticeToken, createdAt: $createdAt, activeAt: $activeAt, order: $order)';
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
            const DeepCollectionEquality().equals(other.blockList, blockList) &&
            const DeepCollectionEquality()
                .equals(other.noticeToken, noticeToken) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.activeAt, activeAt) &&
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
      const DeepCollectionEquality().hash(blockList),
      const DeepCollectionEquality().hash(noticeToken),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(activeAt),
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
      List<String>? blockList,
      List<String>? noticeToken,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? activeAt,
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
  List<String>? get blockList;
  @override
  List<String>? get noticeToken;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get activeAt;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FriendWithIdTearOff {
  const _$FriendWithIdTearOff();

  _FriendWithId call({required String uid, required Friend friend}) {
    return _FriendWithId(
      uid: uid,
      friend: friend,
    );
  }
}

/// @nodoc
const $FriendWithId = _$FriendWithIdTearOff();

/// @nodoc
mixin _$FriendWithId {
  String get uid => throw _privateConstructorUsedError;
  Friend get friend => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendWithIdCopyWith<FriendWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendWithIdCopyWith<$Res> {
  factory $FriendWithIdCopyWith(
          FriendWithId value, $Res Function(FriendWithId) then) =
      _$FriendWithIdCopyWithImpl<$Res>;
  $Res call({String uid, Friend friend});

  $FriendCopyWith<$Res> get friend;
}

/// @nodoc
class _$FriendWithIdCopyWithImpl<$Res> implements $FriendWithIdCopyWith<$Res> {
  _$FriendWithIdCopyWithImpl(this._value, this._then);

  final FriendWithId _value;
  // ignore: unused_field
  final $Res Function(FriendWithId) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? friend = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      friend: friend == freezed
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as Friend,
    ));
  }

  @override
  $FriendCopyWith<$Res> get friend {
    return $FriendCopyWith<$Res>(_value.friend, (value) {
      return _then(_value.copyWith(friend: value));
    });
  }
}

/// @nodoc
abstract class _$FriendWithIdCopyWith<$Res>
    implements $FriendWithIdCopyWith<$Res> {
  factory _$FriendWithIdCopyWith(
          _FriendWithId value, $Res Function(_FriendWithId) then) =
      __$FriendWithIdCopyWithImpl<$Res>;
  @override
  $Res call({String uid, Friend friend});

  @override
  $FriendCopyWith<$Res> get friend;
}

/// @nodoc
class __$FriendWithIdCopyWithImpl<$Res> extends _$FriendWithIdCopyWithImpl<$Res>
    implements _$FriendWithIdCopyWith<$Res> {
  __$FriendWithIdCopyWithImpl(
      _FriendWithId _value, $Res Function(_FriendWithId) _then)
      : super(_value, (v) => _then(v as _FriendWithId));

  @override
  _FriendWithId get _value => super._value as _FriendWithId;

  @override
  $Res call({
    Object? uid = freezed,
    Object? friend = freezed,
  }) {
    return _then(_FriendWithId(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      friend: friend == freezed
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as Friend,
    ));
  }
}

/// @nodoc

class _$_FriendWithId extends _FriendWithId {
  _$_FriendWithId({required this.uid, required this.friend}) : super._();

  @override
  final String uid;
  @override
  final Friend friend;

  @override
  String toString() {
    return 'FriendWithId(uid: $uid, friend: $friend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendWithId &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.friend, friend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(friend));

  @JsonKey(ignore: true)
  @override
  _$FriendWithIdCopyWith<_FriendWithId> get copyWith =>
      __$FriendWithIdCopyWithImpl<_FriendWithId>(this, _$identity);
}

abstract class _FriendWithId extends FriendWithId {
  factory _FriendWithId({required String uid, required Friend friend}) =
      _$_FriendWithId;
  _FriendWithId._() : super._();

  @override
  String get uid;
  @override
  Friend get friend;
  @override
  @JsonKey(ignore: true)
  _$FriendWithIdCopyWith<_FriendWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
class _$FriendTearOff {
  const _$FriendTearOff();

  _Friend call(
      {required String name,
      required String uid,
      required String chatRoomId,
      String? avatar,
      @TimestampConverter() DateTime? createdAt}) {
    return _Friend(
      name: name,
      uid: uid,
      chatRoomId: chatRoomId,
      avatar: avatar,
      createdAt: createdAt,
    );
  }

  Friend fromJson(Map<String, Object?> json) {
    return Friend.fromJson(json);
  }
}

/// @nodoc
const $Friend = _$FriendTearOff();

/// @nodoc
mixin _$Friend {
  String get name => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get chatRoomId => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String uid,
      String chatRoomId,
      String? avatar,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? uid = freezed,
    Object? chatRoomId = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: chatRoomId == freezed
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$FriendCopyWith(_Friend value, $Res Function(_Friend) then) =
      __$FriendCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String uid,
      String chatRoomId,
      String? avatar,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$FriendCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements _$FriendCopyWith<$Res> {
  __$FriendCopyWithImpl(_Friend _value, $Res Function(_Friend) _then)
      : super(_value, (v) => _then(v as _Friend));

  @override
  _Friend get _value => super._value as _Friend;

  @override
  $Res call({
    Object? name = freezed,
    Object? uid = freezed,
    Object? chatRoomId = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Friend(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: chatRoomId == freezed
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friend extends _Friend {
  _$_Friend(
      {required this.name,
      required this.uid,
      required this.chatRoomId,
      this.avatar,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  final String name;
  @override
  final String uid;
  @override
  final String chatRoomId;
  @override
  final String? avatar;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Friend(name: $name, uid: $uid, chatRoomId: $chatRoomId, avatar: $avatar, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Friend &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.chatRoomId, chatRoomId) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(chatRoomId),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$FriendCopyWith<_Friend> get copyWith =>
      __$FriendCopyWithImpl<_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendToJson(this);
  }
}

abstract class _Friend extends Friend {
  factory _Friend(
      {required String name,
      required String uid,
      required String chatRoomId,
      String? avatar,
      @TimestampConverter() DateTime? createdAt}) = _$_Friend;
  _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  String get name;
  @override
  String get uid;
  @override
  String get chatRoomId;
  @override
  String? get avatar;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$FriendCopyWith<_Friend> get copyWith => throw _privateConstructorUsedError;
}

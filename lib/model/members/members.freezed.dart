// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Members _$MembersFromJson(Map<String, dynamic> json) {
  return _Members.fromJson(json);
}

/// @nodoc
class _$MembersTearOff {
  const _$MembersTearOff();

  _Members call(
      {required String uid,
      required String name,
      String? avatar,
      required bool organizer,
      @TimestampConverter() DateTime? createdAt}) {
    return _Members(
      uid: uid,
      name: name,
      avatar: avatar,
      organizer: organizer,
      createdAt: createdAt,
    );
  }

  Members fromJson(Map<String, Object?> json) {
    return Members.fromJson(json);
  }
}

/// @nodoc
const $Members = _$MembersTearOff();

/// @nodoc
mixin _$Members {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool get organizer => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembersCopyWith<Members> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembersCopyWith<$Res> {
  factory $MembersCopyWith(Members value, $Res Function(Members) then) =
      _$MembersCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String? avatar,
      bool organizer,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$MembersCopyWithImpl<$Res> implements $MembersCopyWith<$Res> {
  _$MembersCopyWithImpl(this._value, this._then);

  final Members _value;
  // ignore: unused_field
  final $Res Function(Members) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? organizer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      organizer: organizer == freezed
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MembersCopyWith<$Res> implements $MembersCopyWith<$Res> {
  factory _$MembersCopyWith(_Members value, $Res Function(_Members) then) =
      __$MembersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String? avatar,
      bool organizer,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$MembersCopyWithImpl<$Res> extends _$MembersCopyWithImpl<$Res>
    implements _$MembersCopyWith<$Res> {
  __$MembersCopyWithImpl(_Members _value, $Res Function(_Members) _then)
      : super(_value, (v) => _then(v as _Members));

  @override
  _Members get _value => super._value as _Members;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? organizer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Members(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      organizer: organizer == freezed
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Members extends _Members {
  _$_Members(
      {required this.uid,
      required this.name,
      this.avatar,
      required this.organizer,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Members.fromJson(Map<String, dynamic> json) =>
      _$$_MembersFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? avatar;
  @override
  final bool organizer;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Members(uid: $uid, name: $name, avatar: $avatar, organizer: $organizer, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Members &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.organizer, organizer) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(organizer),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$MembersCopyWith<_Members> get copyWith =>
      __$MembersCopyWithImpl<_Members>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MembersToJson(this);
  }
}

abstract class _Members extends Members {
  factory _Members(
      {required String uid,
      required String name,
      String? avatar,
      required bool organizer,
      @TimestampConverter() DateTime? createdAt}) = _$_Members;
  _Members._() : super._();

  factory _Members.fromJson(Map<String, dynamic> json) = _$_Members.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  bool get organizer;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$MembersCopyWith<_Members> get copyWith =>
      throw _privateConstructorUsedError;
}

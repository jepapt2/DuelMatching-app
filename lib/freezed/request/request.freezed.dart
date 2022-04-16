// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Request _$RequestFromJson(Map<String, dynamic> json) {
  return _Request.fromJson(json);
}

/// @nodoc
class _$RequestTearOff {
  const _$RequestTearOff();

  _Request call(
      {required String sendId,
      required String sendName,
      String? sendAvatar,
      required String recId,
      required bool permission,
      required bool rejection,
      @TimestampConverter() DateTime? updateAt}) {
    return _Request(
      sendId: sendId,
      sendName: sendName,
      sendAvatar: sendAvatar,
      recId: recId,
      permission: permission,
      rejection: rejection,
      updateAt: updateAt,
    );
  }

  Request fromJson(Map<String, Object?> json) {
    return Request.fromJson(json);
  }
}

/// @nodoc
const $Request = _$RequestTearOff();

/// @nodoc
mixin _$Request {
  String get sendId => throw _privateConstructorUsedError;
  String get sendName => throw _privateConstructorUsedError;
  String? get sendAvatar => throw _privateConstructorUsedError;
  String get recId => throw _privateConstructorUsedError;
  bool get permission => throw _privateConstructorUsedError;
  bool get rejection => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res>;
  $Res call(
      {String sendId,
      String sendName,
      String? sendAvatar,
      String recId,
      bool permission,
      bool rejection,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res> implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  final Request _value;
  // ignore: unused_field
  final $Res Function(Request) _then;

  @override
  $Res call({
    Object? sendId = freezed,
    Object? sendName = freezed,
    Object? sendAvatar = freezed,
    Object? recId = freezed,
    Object? permission = freezed,
    Object? rejection = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      sendId: sendId == freezed
          ? _value.sendId
          : sendId // ignore: cast_nullable_to_non_nullable
              as String,
      sendName: sendName == freezed
          ? _value.sendName
          : sendName // ignore: cast_nullable_to_non_nullable
              as String,
      sendAvatar: sendAvatar == freezed
          ? _value.sendAvatar
          : sendAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      recId: recId == freezed
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as String,
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
      rejection: rejection == freezed
          ? _value.rejection
          : rejection // ignore: cast_nullable_to_non_nullable
              as bool,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$RequestCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$RequestCopyWith(_Request value, $Res Function(_Request) then) =
      __$RequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sendId,
      String sendName,
      String? sendAvatar,
      String recId,
      bool permission,
      bool rejection,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class __$RequestCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements _$RequestCopyWith<$Res> {
  __$RequestCopyWithImpl(_Request _value, $Res Function(_Request) _then)
      : super(_value, (v) => _then(v as _Request));

  @override
  _Request get _value => super._value as _Request;

  @override
  $Res call({
    Object? sendId = freezed,
    Object? sendName = freezed,
    Object? sendAvatar = freezed,
    Object? recId = freezed,
    Object? permission = freezed,
    Object? rejection = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_Request(
      sendId: sendId == freezed
          ? _value.sendId
          : sendId // ignore: cast_nullable_to_non_nullable
              as String,
      sendName: sendName == freezed
          ? _value.sendName
          : sendName // ignore: cast_nullable_to_non_nullable
              as String,
      sendAvatar: sendAvatar == freezed
          ? _value.sendAvatar
          : sendAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      recId: recId == freezed
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as String,
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
      rejection: rejection == freezed
          ? _value.rejection
          : rejection // ignore: cast_nullable_to_non_nullable
              as bool,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Request extends _Request {
  _$_Request(
      {required this.sendId,
      required this.sendName,
      this.sendAvatar,
      required this.recId,
      required this.permission,
      required this.rejection,
      @TimestampConverter() this.updateAt})
      : super._();

  factory _$_Request.fromJson(Map<String, dynamic> json) =>
      _$$_RequestFromJson(json);

  @override
  final String sendId;
  @override
  final String sendName;
  @override
  final String? sendAvatar;
  @override
  final String recId;
  @override
  final bool permission;
  @override
  final bool rejection;
  @override
  @TimestampConverter()
  final DateTime? updateAt;

  @override
  String toString() {
    return 'Request(sendId: $sendId, sendName: $sendName, sendAvatar: $sendAvatar, recId: $recId, permission: $permission, rejection: $rejection, updateAt: $updateAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Request &&
            const DeepCollectionEquality().equals(other.sendId, sendId) &&
            const DeepCollectionEquality().equals(other.sendName, sendName) &&
            const DeepCollectionEquality()
                .equals(other.sendAvatar, sendAvatar) &&
            const DeepCollectionEquality().equals(other.recId, recId) &&
            const DeepCollectionEquality()
                .equals(other.permission, permission) &&
            const DeepCollectionEquality().equals(other.rejection, rejection) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sendId),
      const DeepCollectionEquality().hash(sendName),
      const DeepCollectionEquality().hash(sendAvatar),
      const DeepCollectionEquality().hash(recId),
      const DeepCollectionEquality().hash(permission),
      const DeepCollectionEquality().hash(rejection),
      const DeepCollectionEquality().hash(updateAt));

  @JsonKey(ignore: true)
  @override
  _$RequestCopyWith<_Request> get copyWith =>
      __$RequestCopyWithImpl<_Request>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestToJson(this);
  }
}

abstract class _Request extends Request {
  factory _Request(
      {required String sendId,
      required String sendName,
      String? sendAvatar,
      required String recId,
      required bool permission,
      required bool rejection,
      @TimestampConverter() DateTime? updateAt}) = _$_Request;
  _Request._() : super._();

  factory _Request.fromJson(Map<String, dynamic> json) = _$_Request.fromJson;

  @override
  String get sendId;
  @override
  String get sendName;
  @override
  String? get sendAvatar;
  @override
  String get recId;
  @override
  bool get permission;
  @override
  bool get rejection;
  @override
  @TimestampConverter()
  DateTime? get updateAt;
  @override
  @JsonKey(ignore: true)
  _$RequestCopyWith<_Request> get copyWith =>
      throw _privateConstructorUsedError;
}

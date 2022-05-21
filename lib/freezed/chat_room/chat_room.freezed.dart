// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestoreChatMessage _$FirestoreChatMessageFromJson(Map<String, dynamic> json) {
  return _FirestoreChatMessage.fromJson(json);
}

/// @nodoc
class _$FirestoreChatMessageTearOff {
  const _$FirestoreChatMessageTearOff();

  _FirestoreChatMessage call(
      {required String text,
      required String userId,
      @TimestampConverter() DateTime? createdAt}) {
    return _FirestoreChatMessage(
      text: text,
      userId: userId,
      createdAt: createdAt,
    );
  }

  FirestoreChatMessage fromJson(Map<String, Object?> json) {
    return FirestoreChatMessage.fromJson(json);
  }
}

/// @nodoc
const $FirestoreChatMessage = _$FirestoreChatMessageTearOff();

/// @nodoc
mixin _$FirestoreChatMessage {
  String get text => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreChatMessageCopyWith<FirestoreChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreChatMessageCopyWith<$Res> {
  factory $FirestoreChatMessageCopyWith(FirestoreChatMessage value,
          $Res Function(FirestoreChatMessage) then) =
      _$FirestoreChatMessageCopyWithImpl<$Res>;
  $Res call(
      {String text, String userId, @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$FirestoreChatMessageCopyWithImpl<$Res>
    implements $FirestoreChatMessageCopyWith<$Res> {
  _$FirestoreChatMessageCopyWithImpl(this._value, this._then);

  final FirestoreChatMessage _value;
  // ignore: unused_field
  final $Res Function(FirestoreChatMessage) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$FirestoreChatMessageCopyWith<$Res>
    implements $FirestoreChatMessageCopyWith<$Res> {
  factory _$FirestoreChatMessageCopyWith(_FirestoreChatMessage value,
          $Res Function(_FirestoreChatMessage) then) =
      __$FirestoreChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String text, String userId, @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$FirestoreChatMessageCopyWithImpl<$Res>
    extends _$FirestoreChatMessageCopyWithImpl<$Res>
    implements _$FirestoreChatMessageCopyWith<$Res> {
  __$FirestoreChatMessageCopyWithImpl(
      _FirestoreChatMessage _value, $Res Function(_FirestoreChatMessage) _then)
      : super(_value, (v) => _then(v as _FirestoreChatMessage));

  @override
  _FirestoreChatMessage get _value => super._value as _FirestoreChatMessage;

  @override
  $Res call({
    Object? text = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_FirestoreChatMessage(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirestoreChatMessage extends _FirestoreChatMessage {
  _$_FirestoreChatMessage(
      {required this.text,
      required this.userId,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_FirestoreChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_FirestoreChatMessageFromJson(json);

  @override
  final String text;
  @override
  final String userId;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FirestoreChatMessage(text: $text, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirestoreChatMessage &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$FirestoreChatMessageCopyWith<_FirestoreChatMessage> get copyWith =>
      __$FirestoreChatMessageCopyWithImpl<_FirestoreChatMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestoreChatMessageToJson(this);
  }
}

abstract class _FirestoreChatMessage extends FirestoreChatMessage {
  factory _FirestoreChatMessage(
      {required String text,
      required String userId,
      @TimestampConverter() DateTime? createdAt}) = _$_FirestoreChatMessage;
  _FirestoreChatMessage._() : super._();

  factory _FirestoreChatMessage.fromJson(Map<String, dynamic> json) =
      _$_FirestoreChatMessage.fromJson;

  @override
  String get text;
  @override
  String get userId;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$FirestoreChatMessageCopyWith<_FirestoreChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return _Partner.fromJson(json);
}

/// @nodoc
class _$PartnerTearOff {
  const _$PartnerTearOff();

  _Partner call(
      {required String uid,
      required String name,
      String? avatar,
      @TimestampConverter() DateTime? lastReadAt}) {
    return _Partner(
      uid: uid,
      name: name,
      avatar: avatar,
      lastReadAt: lastReadAt,
    );
  }

  Partner fromJson(Map<String, Object?> json) {
    return Partner.fromJson(json);
  }
}

/// @nodoc
const $Partner = _$PartnerTearOff();

/// @nodoc
mixin _$Partner {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get lastReadAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerCopyWith<Partner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerCopyWith<$Res> {
  factory $PartnerCopyWith(Partner value, $Res Function(Partner) then) =
      _$PartnerCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String? avatar,
      @TimestampConverter() DateTime? lastReadAt});
}

/// @nodoc
class _$PartnerCopyWithImpl<$Res> implements $PartnerCopyWith<$Res> {
  _$PartnerCopyWithImpl(this._value, this._then);

  final Partner _value;
  // ignore: unused_field
  final $Res Function(Partner) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? lastReadAt = freezed,
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
      lastReadAt: lastReadAt == freezed
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PartnerCopyWith<$Res> implements $PartnerCopyWith<$Res> {
  factory _$PartnerCopyWith(_Partner value, $Res Function(_Partner) then) =
      __$PartnerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String? avatar,
      @TimestampConverter() DateTime? lastReadAt});
}

/// @nodoc
class __$PartnerCopyWithImpl<$Res> extends _$PartnerCopyWithImpl<$Res>
    implements _$PartnerCopyWith<$Res> {
  __$PartnerCopyWithImpl(_Partner _value, $Res Function(_Partner) _then)
      : super(_value, (v) => _then(v as _Partner));

  @override
  _Partner get _value => super._value as _Partner;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? lastReadAt = freezed,
  }) {
    return _then(_Partner(
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
      lastReadAt: lastReadAt == freezed
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Partner extends _Partner {
  _$_Partner(
      {required this.uid,
      required this.name,
      this.avatar,
      @TimestampConverter() this.lastReadAt})
      : super._();

  factory _$_Partner.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? avatar;
  @override
  @TimestampConverter()
  final DateTime? lastReadAt;

  @override
  String toString() {
    return 'Partner(uid: $uid, name: $name, avatar: $avatar, lastReadAt: $lastReadAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Partner &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality()
                .equals(other.lastReadAt, lastReadAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(lastReadAt));

  @JsonKey(ignore: true)
  @override
  _$PartnerCopyWith<_Partner> get copyWith =>
      __$PartnerCopyWithImpl<_Partner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerToJson(this);
  }
}

abstract class _Partner extends Partner {
  factory _Partner(
      {required String uid,
      required String name,
      String? avatar,
      @TimestampConverter() DateTime? lastReadAt}) = _$_Partner;
  _Partner._() : super._();

  factory _Partner.fromJson(Map<String, dynamic> json) = _$_Partner.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  @TimestampConverter()
  DateTime? get lastReadAt;
  @override
  @JsonKey(ignore: true)
  _$PartnerCopyWith<_Partner> get copyWith =>
      throw _privateConstructorUsedError;
}

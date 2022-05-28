// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
class _$MemberTearOff {
  const _$MemberTearOff();

  _Member call(
      {required String uid,
      required String name,
      String? avatar,
      required bool organizer,
      List<String>? noticeToken,
      required String noticeTitle,
      @TimestampConverter() DateTime? createdAt}) {
    return _Member(
      uid: uid,
      name: name,
      avatar: avatar,
      organizer: organizer,
      noticeToken: noticeToken,
      noticeTitle: noticeTitle,
      createdAt: createdAt,
    );
  }

  Member fromJson(Map<String, Object?> json) {
    return Member.fromJson(json);
  }
}

/// @nodoc
const $Member = _$MemberTearOff();

/// @nodoc
mixin _$Member {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool get organizer => throw _privateConstructorUsedError;
  List<String>? get noticeToken => throw _privateConstructorUsedError;
  String get noticeTitle => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String? avatar,
      bool organizer,
      List<String>? noticeToken,
      String noticeTitle,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? organizer = freezed,
    Object? noticeToken = freezed,
    Object? noticeTitle = freezed,
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
      noticeToken: noticeToken == freezed
          ? _value.noticeToken
          : noticeToken // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noticeTitle: noticeTitle == freezed
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) then) =
      __$MemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String? avatar,
      bool organizer,
      List<String>? noticeToken,
      String noticeTitle,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(_Member _value, $Res Function(_Member) _then)
      : super(_value, (v) => _then(v as _Member));

  @override
  _Member get _value => super._value as _Member;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? organizer = freezed,
    Object? noticeToken = freezed,
    Object? noticeTitle = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Member(
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
      noticeToken: noticeToken == freezed
          ? _value.noticeToken
          : noticeToken // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noticeTitle: noticeTitle == freezed
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
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
class _$_Member extends _Member {
  _$_Member(
      {required this.uid,
      required this.name,
      this.avatar,
      required this.organizer,
      this.noticeToken,
      required this.noticeTitle,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$$_MemberFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? avatar;
  @override
  final bool organizer;
  @override
  final List<String>? noticeToken;
  @override
  final String noticeTitle;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Member(uid: $uid, name: $name, avatar: $avatar, organizer: $organizer, noticeToken: $noticeToken, noticeTitle: $noticeTitle, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Member &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.organizer, organizer) &&
            const DeepCollectionEquality()
                .equals(other.noticeToken, noticeToken) &&
            const DeepCollectionEquality()
                .equals(other.noticeTitle, noticeTitle) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(organizer),
      const DeepCollectionEquality().hash(noticeToken),
      const DeepCollectionEquality().hash(noticeTitle),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(this);
  }
}

abstract class _Member extends Member {
  factory _Member(
      {required String uid,
      required String name,
      String? avatar,
      required bool organizer,
      List<String>? noticeToken,
      required String noticeTitle,
      @TimestampConverter() DateTime? createdAt}) = _$_Member;
  _Member._() : super._();

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  bool get organizer;
  @override
  List<String>? get noticeToken;
  @override
  String get noticeTitle;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$MemberCopyWith<_Member> get copyWith => throw _privateConstructorUsedError;
}

FirestoreGroupChatMessage _$FirestoreGroupChatMessageFromJson(
    Map<String, dynamic> json) {
  return _FirestoreGroupChatMessage.fromJson(json);
}

/// @nodoc
class _$FirestoreGroupChatMessageTearOff {
  const _$FirestoreGroupChatMessageTearOff();

  _FirestoreGroupChatMessage call(
      {required String text,
      required String userId,
      required String noticeName,
      @TimestampConverter() DateTime? createdAt}) {
    return _FirestoreGroupChatMessage(
      text: text,
      userId: userId,
      noticeName: noticeName,
      createdAt: createdAt,
    );
  }

  FirestoreGroupChatMessage fromJson(Map<String, Object?> json) {
    return FirestoreGroupChatMessage.fromJson(json);
  }
}

/// @nodoc
const $FirestoreGroupChatMessage = _$FirestoreGroupChatMessageTearOff();

/// @nodoc
mixin _$FirestoreGroupChatMessage {
  String get text => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get noticeName => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreGroupChatMessageCopyWith<FirestoreGroupChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreGroupChatMessageCopyWith<$Res> {
  factory $FirestoreGroupChatMessageCopyWith(FirestoreGroupChatMessage value,
          $Res Function(FirestoreGroupChatMessage) then) =
      _$FirestoreGroupChatMessageCopyWithImpl<$Res>;
  $Res call(
      {String text,
      String userId,
      String noticeName,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$FirestoreGroupChatMessageCopyWithImpl<$Res>
    implements $FirestoreGroupChatMessageCopyWith<$Res> {
  _$FirestoreGroupChatMessageCopyWithImpl(this._value, this._then);

  final FirestoreGroupChatMessage _value;
  // ignore: unused_field
  final $Res Function(FirestoreGroupChatMessage) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? userId = freezed,
    Object? noticeName = freezed,
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
      noticeName: noticeName == freezed
          ? _value.noticeName
          : noticeName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$FirestoreGroupChatMessageCopyWith<$Res>
    implements $FirestoreGroupChatMessageCopyWith<$Res> {
  factory _$FirestoreGroupChatMessageCopyWith(_FirestoreGroupChatMessage value,
          $Res Function(_FirestoreGroupChatMessage) then) =
      __$FirestoreGroupChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String text,
      String userId,
      String noticeName,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$FirestoreGroupChatMessageCopyWithImpl<$Res>
    extends _$FirestoreGroupChatMessageCopyWithImpl<$Res>
    implements _$FirestoreGroupChatMessageCopyWith<$Res> {
  __$FirestoreGroupChatMessageCopyWithImpl(_FirestoreGroupChatMessage _value,
      $Res Function(_FirestoreGroupChatMessage) _then)
      : super(_value, (v) => _then(v as _FirestoreGroupChatMessage));

  @override
  _FirestoreGroupChatMessage get _value =>
      super._value as _FirestoreGroupChatMessage;

  @override
  $Res call({
    Object? text = freezed,
    Object? userId = freezed,
    Object? noticeName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_FirestoreGroupChatMessage(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      noticeName: noticeName == freezed
          ? _value.noticeName
          : noticeName // ignore: cast_nullable_to_non_nullable
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
class _$_FirestoreGroupChatMessage extends _FirestoreGroupChatMessage {
  _$_FirestoreGroupChatMessage(
      {required this.text,
      required this.userId,
      required this.noticeName,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_FirestoreGroupChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_FirestoreGroupChatMessageFromJson(json);

  @override
  final String text;
  @override
  final String userId;
  @override
  final String noticeName;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FirestoreGroupChatMessage(text: $text, userId: $userId, noticeName: $noticeName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirestoreGroupChatMessage &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.noticeName, noticeName) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(noticeName),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$FirestoreGroupChatMessageCopyWith<_FirestoreGroupChatMessage>
      get copyWith =>
          __$FirestoreGroupChatMessageCopyWithImpl<_FirestoreGroupChatMessage>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestoreGroupChatMessageToJson(this);
  }
}

abstract class _FirestoreGroupChatMessage extends FirestoreGroupChatMessage {
  factory _FirestoreGroupChatMessage(
          {required String text,
          required String userId,
          required String noticeName,
          @TimestampConverter() DateTime? createdAt}) =
      _$_FirestoreGroupChatMessage;
  _FirestoreGroupChatMessage._() : super._();

  factory _FirestoreGroupChatMessage.fromJson(Map<String, dynamic> json) =
      _$_FirestoreGroupChatMessage.fromJson;

  @override
  String get text;
  @override
  String get userId;
  @override
  String get noticeName;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$FirestoreGroupChatMessageCopyWith<_FirestoreGroupChatMessage>
      get copyWith => throw _privateConstructorUsedError;
}

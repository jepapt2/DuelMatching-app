// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoticeWithIdTearOff {
  const _$NoticeWithIdTearOff();

  _NoticeWithId call({required String id, required Notice notice}) {
    return _NoticeWithId(
      id: id,
      notice: notice,
    );
  }
}

/// @nodoc
const $NoticeWithId = _$NoticeWithIdTearOff();

/// @nodoc
mixin _$NoticeWithId {
  String get id => throw _privateConstructorUsedError;
  Notice get notice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoticeWithIdCopyWith<NoticeWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeWithIdCopyWith<$Res> {
  factory $NoticeWithIdCopyWith(
          NoticeWithId value, $Res Function(NoticeWithId) then) =
      _$NoticeWithIdCopyWithImpl<$Res>;
  $Res call({String id, Notice notice});

  $NoticeCopyWith<$Res> get notice;
}

/// @nodoc
class _$NoticeWithIdCopyWithImpl<$Res> implements $NoticeWithIdCopyWith<$Res> {
  _$NoticeWithIdCopyWithImpl(this._value, this._then);

  final NoticeWithId _value;
  // ignore: unused_field
  final $Res Function(NoticeWithId) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? notice = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notice: notice == freezed
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
    ));
  }

  @override
  $NoticeCopyWith<$Res> get notice {
    return $NoticeCopyWith<$Res>(_value.notice, (value) {
      return _then(_value.copyWith(notice: value));
    });
  }
}

/// @nodoc
abstract class _$NoticeWithIdCopyWith<$Res>
    implements $NoticeWithIdCopyWith<$Res> {
  factory _$NoticeWithIdCopyWith(
          _NoticeWithId value, $Res Function(_NoticeWithId) then) =
      __$NoticeWithIdCopyWithImpl<$Res>;
  @override
  $Res call({String id, Notice notice});

  @override
  $NoticeCopyWith<$Res> get notice;
}

/// @nodoc
class __$NoticeWithIdCopyWithImpl<$Res> extends _$NoticeWithIdCopyWithImpl<$Res>
    implements _$NoticeWithIdCopyWith<$Res> {
  __$NoticeWithIdCopyWithImpl(
      _NoticeWithId _value, $Res Function(_NoticeWithId) _then)
      : super(_value, (v) => _then(v as _NoticeWithId));

  @override
  _NoticeWithId get _value => super._value as _NoticeWithId;

  @override
  $Res call({
    Object? id = freezed,
    Object? notice = freezed,
  }) {
    return _then(_NoticeWithId(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notice: notice == freezed
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
    ));
  }
}

/// @nodoc

class _$_NoticeWithId extends _NoticeWithId {
  _$_NoticeWithId({required this.id, required this.notice}) : super._();

  @override
  final String id;
  @override
  final Notice notice;

  @override
  String toString() {
    return 'NoticeWithId(id: $id, notice: $notice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeWithId &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.notice, notice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(notice));

  @JsonKey(ignore: true)
  @override
  _$NoticeWithIdCopyWith<_NoticeWithId> get copyWith =>
      __$NoticeWithIdCopyWithImpl<_NoticeWithId>(this, _$identity);
}

abstract class _NoticeWithId extends NoticeWithId {
  factory _NoticeWithId({required String id, required Notice notice}) =
      _$_NoticeWithId;
  _NoticeWithId._() : super._();

  @override
  String get id;
  @override
  Notice get notice;
  @override
  @JsonKey(ignore: true)
  _$NoticeWithIdCopyWith<_NoticeWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return _Notice.fromJson(json);
}

/// @nodoc
class _$NoticeTearOff {
  const _$NoticeTearOff();

  _Notice call(
      {required String type,
      String? text,
      required String recName,
      String? recId,
      String? recAvatar,
      String? roomId,
      required int unReadCount,
      @TimestampConverter() DateTime? updateAt}) {
    return _Notice(
      type: type,
      text: text,
      recName: recName,
      recId: recId,
      recAvatar: recAvatar,
      roomId: roomId,
      unReadCount: unReadCount,
      updateAt: updateAt,
    );
  }

  Notice fromJson(Map<String, Object?> json) {
    return Notice.fromJson(json);
  }
}

/// @nodoc
const $Notice = _$NoticeTearOff();

/// @nodoc
mixin _$Notice {
  String get type => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String get recName => throw _privateConstructorUsedError;
  String? get recId => throw _privateConstructorUsedError;
  String? get recAvatar => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  int get unReadCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeCopyWith<Notice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeCopyWith<$Res> {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) then) =
      _$NoticeCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String? text,
      String recName,
      String? recId,
      String? recAvatar,
      String? roomId,
      int unReadCount,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class _$NoticeCopyWithImpl<$Res> implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._value, this._then);

  final Notice _value;
  // ignore: unused_field
  final $Res Function(Notice) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? text = freezed,
    Object? recName = freezed,
    Object? recId = freezed,
    Object? recAvatar = freezed,
    Object? roomId = freezed,
    Object? unReadCount = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      recName: recName == freezed
          ? _value.recName
          : recName // ignore: cast_nullable_to_non_nullable
              as String,
      recId: recId == freezed
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as String?,
      recAvatar: recAvatar == freezed
          ? _value.recAvatar
          : recAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      unReadCount: unReadCount == freezed
          ? _value.unReadCount
          : unReadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$NoticeCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$NoticeCopyWith(_Notice value, $Res Function(_Notice) then) =
      __$NoticeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String? text,
      String recName,
      String? recId,
      String? recAvatar,
      String? roomId,
      int unReadCount,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class __$NoticeCopyWithImpl<$Res> extends _$NoticeCopyWithImpl<$Res>
    implements _$NoticeCopyWith<$Res> {
  __$NoticeCopyWithImpl(_Notice _value, $Res Function(_Notice) _then)
      : super(_value, (v) => _then(v as _Notice));

  @override
  _Notice get _value => super._value as _Notice;

  @override
  $Res call({
    Object? type = freezed,
    Object? text = freezed,
    Object? recName = freezed,
    Object? recId = freezed,
    Object? recAvatar = freezed,
    Object? roomId = freezed,
    Object? unReadCount = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_Notice(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      recName: recName == freezed
          ? _value.recName
          : recName // ignore: cast_nullable_to_non_nullable
              as String,
      recId: recId == freezed
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as String?,
      recAvatar: recAvatar == freezed
          ? _value.recAvatar
          : recAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      unReadCount: unReadCount == freezed
          ? _value.unReadCount
          : unReadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notice extends _Notice {
  _$_Notice(
      {required this.type,
      this.text,
      required this.recName,
      this.recId,
      this.recAvatar,
      this.roomId,
      required this.unReadCount,
      @TimestampConverter() this.updateAt})
      : super._();

  factory _$_Notice.fromJson(Map<String, dynamic> json) =>
      _$$_NoticeFromJson(json);

  @override
  final String type;
  @override
  final String? text;
  @override
  final String recName;
  @override
  final String? recId;
  @override
  final String? recAvatar;
  @override
  final String? roomId;
  @override
  final int unReadCount;
  @override
  @TimestampConverter()
  final DateTime? updateAt;

  @override
  String toString() {
    return 'Notice(type: $type, text: $text, recName: $recName, recId: $recId, recAvatar: $recAvatar, roomId: $roomId, unReadCount: $unReadCount, updateAt: $updateAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notice &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.recName, recName) &&
            const DeepCollectionEquality().equals(other.recId, recId) &&
            const DeepCollectionEquality().equals(other.recAvatar, recAvatar) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality()
                .equals(other.unReadCount, unReadCount) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(recName),
      const DeepCollectionEquality().hash(recId),
      const DeepCollectionEquality().hash(recAvatar),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(unReadCount),
      const DeepCollectionEquality().hash(updateAt));

  @JsonKey(ignore: true)
  @override
  _$NoticeCopyWith<_Notice> get copyWith =>
      __$NoticeCopyWithImpl<_Notice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoticeToJson(this);
  }
}

abstract class _Notice extends Notice {
  factory _Notice(
      {required String type,
      String? text,
      required String recName,
      String? recId,
      String? recAvatar,
      String? roomId,
      required int unReadCount,
      @TimestampConverter() DateTime? updateAt}) = _$_Notice;
  _Notice._() : super._();

  factory _Notice.fromJson(Map<String, dynamic> json) = _$_Notice.fromJson;

  @override
  String get type;
  @override
  String? get text;
  @override
  String get recName;
  @override
  String? get recId;
  @override
  String? get recAvatar;
  @override
  String? get roomId;
  @override
  int get unReadCount;
  @override
  @TimestampConverter()
  DateTime? get updateAt;
  @override
  @JsonKey(ignore: true)
  _$NoticeCopyWith<_Notice> get copyWith => throw _privateConstructorUsedError;
}

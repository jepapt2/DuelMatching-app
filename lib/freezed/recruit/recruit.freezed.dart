// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recruit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recruit _$RecruitFromJson(Map<String, dynamic> json) {
  return _Recruit.fromJson(json);
}

/// @nodoc
class _$RecruitTearOff {
  const _$RecruitTearOff();

  _Recruit call(
      {required String title,
      required String playTitle,
      String? format,
      required String place,
      required String point,
      @TimestampConverter() DateTime? start,
      @TimestampConverter() DateTime? end,
      @TimestampConverter() DateTime? limit,
      required bool friendOnly,
      required int recruitNumber,
      String? overview,
      required int memberCount,
      required bool full,
      required bool cancel,
      required bool close,
      int? order,
      required String organizerId,
      @TimestampConverter() DateTime? createdAt}) {
    return _Recruit(
      title: title,
      playTitle: playTitle,
      format: format,
      place: place,
      point: point,
      start: start,
      end: end,
      limit: limit,
      friendOnly: friendOnly,
      recruitNumber: recruitNumber,
      overview: overview,
      memberCount: memberCount,
      full: full,
      cancel: cancel,
      close: close,
      order: order,
      organizerId: organizerId,
      createdAt: createdAt,
    );
  }

  Recruit fromJson(Map<String, Object?> json) {
    return Recruit.fromJson(json);
  }
}

/// @nodoc
const $Recruit = _$RecruitTearOff();

/// @nodoc
mixin _$Recruit {
  String get title => throw _privateConstructorUsedError;
  String get playTitle => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  String get point => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get start => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get end => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get limit => throw _privateConstructorUsedError;
  bool get friendOnly => throw _privateConstructorUsedError;
  int get recruitNumber => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  bool get full => throw _privateConstructorUsedError;
  bool get cancel => throw _privateConstructorUsedError;
  bool get close => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecruitCopyWith<Recruit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruitCopyWith<$Res> {
  factory $RecruitCopyWith(Recruit value, $Res Function(Recruit) then) =
      _$RecruitCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String playTitle,
      String? format,
      String place,
      String point,
      @TimestampConverter() DateTime? start,
      @TimestampConverter() DateTime? end,
      @TimestampConverter() DateTime? limit,
      bool friendOnly,
      int recruitNumber,
      String? overview,
      int memberCount,
      bool full,
      bool cancel,
      bool close,
      int? order,
      String organizerId,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$RecruitCopyWithImpl<$Res> implements $RecruitCopyWith<$Res> {
  _$RecruitCopyWithImpl(this._value, this._then);

  final Recruit _value;
  // ignore: unused_field
  final $Res Function(Recruit) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? playTitle = freezed,
    Object? format = freezed,
    Object? place = freezed,
    Object? point = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? limit = freezed,
    Object? friendOnly = freezed,
    Object? recruitNumber = freezed,
    Object? overview = freezed,
    Object? memberCount = freezed,
    Object? full = freezed,
    Object? cancel = freezed,
    Object? close = freezed,
    Object? order = freezed,
    Object? organizerId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      friendOnly: friendOnly == freezed
          ? _value.friendOnly
          : friendOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      recruitNumber: recruitNumber == freezed
          ? _value.recruitNumber
          : recruitNumber // ignore: cast_nullable_to_non_nullable
              as int,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      full: full == freezed
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as bool,
      cancel: cancel == freezed
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as bool,
      close: close == freezed
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as bool,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      organizerId: organizerId == freezed
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$RecruitCopyWith<$Res> implements $RecruitCopyWith<$Res> {
  factory _$RecruitCopyWith(_Recruit value, $Res Function(_Recruit) then) =
      __$RecruitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String playTitle,
      String? format,
      String place,
      String point,
      @TimestampConverter() DateTime? start,
      @TimestampConverter() DateTime? end,
      @TimestampConverter() DateTime? limit,
      bool friendOnly,
      int recruitNumber,
      String? overview,
      int memberCount,
      bool full,
      bool cancel,
      bool close,
      int? order,
      String organizerId,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$RecruitCopyWithImpl<$Res> extends _$RecruitCopyWithImpl<$Res>
    implements _$RecruitCopyWith<$Res> {
  __$RecruitCopyWithImpl(_Recruit _value, $Res Function(_Recruit) _then)
      : super(_value, (v) => _then(v as _Recruit));

  @override
  _Recruit get _value => super._value as _Recruit;

  @override
  $Res call({
    Object? title = freezed,
    Object? playTitle = freezed,
    Object? format = freezed,
    Object? place = freezed,
    Object? point = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? limit = freezed,
    Object? friendOnly = freezed,
    Object? recruitNumber = freezed,
    Object? overview = freezed,
    Object? memberCount = freezed,
    Object? full = freezed,
    Object? cancel = freezed,
    Object? close = freezed,
    Object? order = freezed,
    Object? organizerId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Recruit(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      friendOnly: friendOnly == freezed
          ? _value.friendOnly
          : friendOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      recruitNumber: recruitNumber == freezed
          ? _value.recruitNumber
          : recruitNumber // ignore: cast_nullable_to_non_nullable
              as int,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      full: full == freezed
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as bool,
      cancel: cancel == freezed
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as bool,
      close: close == freezed
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as bool,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      organizerId: organizerId == freezed
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
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
class _$_Recruit extends _Recruit {
  _$_Recruit(
      {required this.title,
      required this.playTitle,
      this.format,
      required this.place,
      required this.point,
      @TimestampConverter() this.start,
      @TimestampConverter() this.end,
      @TimestampConverter() this.limit,
      required this.friendOnly,
      required this.recruitNumber,
      this.overview,
      required this.memberCount,
      required this.full,
      required this.cancel,
      required this.close,
      this.order,
      required this.organizerId,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Recruit.fromJson(Map<String, dynamic> json) =>
      _$$_RecruitFromJson(json);

  @override
  final String title;
  @override
  final String playTitle;
  @override
  final String? format;
  @override
  final String place;
  @override
  final String point;
  @override
  @TimestampConverter()
  final DateTime? start;
  @override
  @TimestampConverter()
  final DateTime? end;
  @override
  @TimestampConverter()
  final DateTime? limit;
  @override
  final bool friendOnly;
  @override
  final int recruitNumber;
  @override
  final String? overview;
  @override
  final int memberCount;
  @override
  final bool full;
  @override
  final bool cancel;
  @override
  final bool close;
  @override
  final int? order;
  @override
  final String organizerId;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Recruit(title: $title, playTitle: $playTitle, format: $format, place: $place, point: $point, start: $start, end: $end, limit: $limit, friendOnly: $friendOnly, recruitNumber: $recruitNumber, overview: $overview, memberCount: $memberCount, full: $full, cancel: $cancel, close: $close, order: $order, organizerId: $organizerId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recruit &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.playTitle, playTitle) &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.friendOnly, friendOnly) &&
            const DeepCollectionEquality()
                .equals(other.recruitNumber, recruitNumber) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.memberCount, memberCount) &&
            const DeepCollectionEquality().equals(other.full, full) &&
            const DeepCollectionEquality().equals(other.cancel, cancel) &&
            const DeepCollectionEquality().equals(other.close, close) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality()
                .equals(other.organizerId, organizerId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(playTitle),
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(place),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(friendOnly),
      const DeepCollectionEquality().hash(recruitNumber),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(memberCount),
      const DeepCollectionEquality().hash(full),
      const DeepCollectionEquality().hash(cancel),
      const DeepCollectionEquality().hash(close),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(organizerId),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$RecruitCopyWith<_Recruit> get copyWith =>
      __$RecruitCopyWithImpl<_Recruit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecruitToJson(this);
  }
}

abstract class _Recruit extends Recruit {
  factory _Recruit(
      {required String title,
      required String playTitle,
      String? format,
      required String place,
      required String point,
      @TimestampConverter() DateTime? start,
      @TimestampConverter() DateTime? end,
      @TimestampConverter() DateTime? limit,
      required bool friendOnly,
      required int recruitNumber,
      String? overview,
      required int memberCount,
      required bool full,
      required bool cancel,
      required bool close,
      int? order,
      required String organizerId,
      @TimestampConverter() DateTime? createdAt}) = _$_Recruit;
  _Recruit._() : super._();

  factory _Recruit.fromJson(Map<String, dynamic> json) = _$_Recruit.fromJson;

  @override
  String get title;
  @override
  String get playTitle;
  @override
  String? get format;
  @override
  String get place;
  @override
  String get point;
  @override
  @TimestampConverter()
  DateTime? get start;
  @override
  @TimestampConverter()
  DateTime? get end;
  @override
  @TimestampConverter()
  DateTime? get limit;
  @override
  bool get friendOnly;
  @override
  int get recruitNumber;
  @override
  String? get overview;
  @override
  int get memberCount;
  @override
  bool get full;
  @override
  bool get cancel;
  @override
  bool get close;
  @override
  int? get order;
  @override
  String get organizerId;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$RecruitCopyWith<_Recruit> get copyWith =>
      throw _privateConstructorUsedError;
}

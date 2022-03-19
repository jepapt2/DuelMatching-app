// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reports _$ReportsFromJson(Map<String, dynamic> json) {
  return _Reports.fromJson(json);
}

/// @nodoc
class _$ReportsTearOff {
  const _$ReportsTearOff();

  _Reports call(
      {required String sendId,
      required String sendName,
      required String reportId,
      required String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt}) {
    return _Reports(
      sendId: sendId,
      sendName: sendName,
      reportId: reportId,
      reason: reason,
      details: details,
      chat: chat,
      createdAt: createdAt,
    );
  }

  Reports fromJson(Map<String, Object?> json) {
    return Reports.fromJson(json);
  }
}

/// @nodoc
const $Reports = _$ReportsTearOff();

/// @nodoc
mixin _$Reports {
  String get sendId => throw _privateConstructorUsedError;
  String get sendName => throw _privateConstructorUsedError;
  String get reportId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get chat => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportsCopyWith<Reports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsCopyWith<$Res> {
  factory $ReportsCopyWith(Reports value, $Res Function(Reports) then) =
      _$ReportsCopyWithImpl<$Res>;
  $Res call(
      {String sendId,
      String sendName,
      String reportId,
      String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$ReportsCopyWithImpl<$Res> implements $ReportsCopyWith<$Res> {
  _$ReportsCopyWithImpl(this._value, this._then);

  final Reports _value;
  // ignore: unused_field
  final $Res Function(Reports) _then;

  @override
  $Res call({
    Object? sendId = freezed,
    Object? sendName = freezed,
    Object? reportId = freezed,
    Object? reason = freezed,
    Object? details = freezed,
    Object? chat = freezed,
    Object? createdAt = freezed,
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
      reportId: reportId == freezed
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ReportsCopyWith<$Res> implements $ReportsCopyWith<$Res> {
  factory _$ReportsCopyWith(_Reports value, $Res Function(_Reports) then) =
      __$ReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sendId,
      String sendName,
      String reportId,
      String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$ReportsCopyWithImpl<$Res> extends _$ReportsCopyWithImpl<$Res>
    implements _$ReportsCopyWith<$Res> {
  __$ReportsCopyWithImpl(_Reports _value, $Res Function(_Reports) _then)
      : super(_value, (v) => _then(v as _Reports));

  @override
  _Reports get _value => super._value as _Reports;

  @override
  $Res call({
    Object? sendId = freezed,
    Object? sendName = freezed,
    Object? reportId = freezed,
    Object? reason = freezed,
    Object? details = freezed,
    Object? chat = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Reports(
      sendId: sendId == freezed
          ? _value.sendId
          : sendId // ignore: cast_nullable_to_non_nullable
              as String,
      sendName: sendName == freezed
          ? _value.sendName
          : sendName // ignore: cast_nullable_to_non_nullable
              as String,
      reportId: reportId == freezed
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
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
class _$_Reports extends _Reports {
  _$_Reports(
      {required this.sendId,
      required this.sendName,
      required this.reportId,
      required this.reason,
      this.details,
      this.chat,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Reports.fromJson(Map<String, dynamic> json) =>
      _$$_ReportsFromJson(json);

  @override
  final String sendId;
  @override
  final String sendName;
  @override
  final String reportId;
  @override
  final String reason;
  @override
  final String? details;
  @override
  final String? chat;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Reports(sendId: $sendId, sendName: $sendName, reportId: $reportId, reason: $reason, details: $details, chat: $chat, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reports &&
            const DeepCollectionEquality().equals(other.sendId, sendId) &&
            const DeepCollectionEquality().equals(other.sendName, sendName) &&
            const DeepCollectionEquality().equals(other.reportId, reportId) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.chat, chat) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sendId),
      const DeepCollectionEquality().hash(sendName),
      const DeepCollectionEquality().hash(reportId),
      const DeepCollectionEquality().hash(reason),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(chat),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ReportsCopyWith<_Reports> get copyWith =>
      __$ReportsCopyWithImpl<_Reports>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportsToJson(this);
  }
}

abstract class _Reports extends Reports {
  factory _Reports(
      {required String sendId,
      required String sendName,
      required String reportId,
      required String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt}) = _$_Reports;
  _Reports._() : super._();

  factory _Reports.fromJson(Map<String, dynamic> json) = _$_Reports.fromJson;

  @override
  String get sendId;
  @override
  String get sendName;
  @override
  String get reportId;
  @override
  String get reason;
  @override
  String? get details;
  @override
  String? get chat;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ReportsCopyWith<_Reports> get copyWith =>
      throw _privateConstructorUsedError;
}

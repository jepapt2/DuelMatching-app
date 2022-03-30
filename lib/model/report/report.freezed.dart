// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
class _$ReportTearOff {
  const _$ReportTearOff();

  _Report call(
      {required String sendId,
      required String sendName,
      required String reportId,
      required String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt}) {
    return _Report(
      sendId: sendId,
      sendName: sendName,
      reportId: reportId,
      reason: reason,
      details: details,
      chat: chat,
      createdAt: createdAt,
    );
  }

  Report fromJson(Map<String, Object?> json) {
    return Report.fromJson(json);
  }
}

/// @nodoc
const $Report = _$ReportTearOff();

/// @nodoc
mixin _$Report {
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
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
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
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

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
abstract class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) then) =
      __$ReportCopyWithImpl<$Res>;
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
class __$ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(_Report _value, $Res Function(_Report) _then)
      : super(_value, (v) => _then(v as _Report));

  @override
  _Report get _value => super._value as _Report;

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
    return _then(_Report(
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
class _$_Report extends _Report {
  _$_Report(
      {required this.sendId,
      required this.sendName,
      required this.reportId,
      required this.reason,
      this.details,
      this.chat,
      @TimestampConverter() this.createdAt})
      : super._();

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

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
    return 'Report(sendId: $sendId, sendName: $sendName, reportId: $reportId, reason: $reason, details: $details, chat: $chat, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Report &&
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
  _$ReportCopyWith<_Report> get copyWith =>
      __$ReportCopyWithImpl<_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(this);
  }
}

abstract class _Report extends Report {
  factory _Report(
      {required String sendId,
      required String sendName,
      required String reportId,
      required String reason,
      String? details,
      String? chat,
      @TimestampConverter() DateTime? createdAt}) = _$_Report;
  _Report._() : super._();

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

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
  _$ReportCopyWith<_Report> get copyWith => throw _privateConstructorUsedError;
}

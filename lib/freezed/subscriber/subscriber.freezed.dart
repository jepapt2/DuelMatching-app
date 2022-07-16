// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscriber.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) {
  return _Subscriber.fromJson(json);
}

/// @nodoc
class _$SubscriberTearOff {
  const _$SubscriberTearOff();

  _Subscriber call(
      {@TimestampConverter() DateTime? canceledAt,
      @TimestampConverter() DateTime? endAt,
      required String entitlementID,
      required String method,
      required String periodType,
      required String productID,
      required String status,
      required String transactionID,
      @TimestampConverter() DateTime? updateAt}) {
    return _Subscriber(
      canceledAt: canceledAt,
      endAt: endAt,
      entitlementID: entitlementID,
      method: method,
      periodType: periodType,
      productID: productID,
      status: status,
      transactionID: transactionID,
      updateAt: updateAt,
    );
  }

  Subscriber fromJson(Map<String, Object?> json) {
    return Subscriber.fromJson(json);
  }
}

/// @nodoc
const $Subscriber = _$SubscriberTearOff();

/// @nodoc
mixin _$Subscriber {
  @TimestampConverter()
  DateTime? get canceledAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get endAt => throw _privateConstructorUsedError;
  String get entitlementID => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get periodType => throw _privateConstructorUsedError;
  String get productID => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get transactionID => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriberCopyWith<Subscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriberCopyWith<$Res> {
  factory $SubscriberCopyWith(
          Subscriber value, $Res Function(Subscriber) then) =
      _$SubscriberCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? canceledAt,
      @TimestampConverter() DateTime? endAt,
      String entitlementID,
      String method,
      String periodType,
      String productID,
      String status,
      String transactionID,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class _$SubscriberCopyWithImpl<$Res> implements $SubscriberCopyWith<$Res> {
  _$SubscriberCopyWithImpl(this._value, this._then);

  final Subscriber _value;
  // ignore: unused_field
  final $Res Function(Subscriber) _then;

  @override
  $Res call({
    Object? canceledAt = freezed,
    Object? endAt = freezed,
    Object? entitlementID = freezed,
    Object? method = freezed,
    Object? periodType = freezed,
    Object? productID = freezed,
    Object? status = freezed,
    Object? transactionID = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      canceledAt: canceledAt == freezed
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entitlementID: entitlementID == freezed
          ? _value.entitlementID
          : entitlementID // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      periodType: periodType == freezed
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as String,
      productID: productID == freezed
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionID: transactionID == freezed
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$SubscriberCopyWith<$Res> implements $SubscriberCopyWith<$Res> {
  factory _$SubscriberCopyWith(
          _Subscriber value, $Res Function(_Subscriber) then) =
      __$SubscriberCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? canceledAt,
      @TimestampConverter() DateTime? endAt,
      String entitlementID,
      String method,
      String periodType,
      String productID,
      String status,
      String transactionID,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class __$SubscriberCopyWithImpl<$Res> extends _$SubscriberCopyWithImpl<$Res>
    implements _$SubscriberCopyWith<$Res> {
  __$SubscriberCopyWithImpl(
      _Subscriber _value, $Res Function(_Subscriber) _then)
      : super(_value, (v) => _then(v as _Subscriber));

  @override
  _Subscriber get _value => super._value as _Subscriber;

  @override
  $Res call({
    Object? canceledAt = freezed,
    Object? endAt = freezed,
    Object? entitlementID = freezed,
    Object? method = freezed,
    Object? periodType = freezed,
    Object? productID = freezed,
    Object? status = freezed,
    Object? transactionID = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_Subscriber(
      canceledAt: canceledAt == freezed
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entitlementID: entitlementID == freezed
          ? _value.entitlementID
          : entitlementID // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      periodType: periodType == freezed
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as String,
      productID: productID == freezed
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionID: transactionID == freezed
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subscriber extends _Subscriber {
  _$_Subscriber(
      {@TimestampConverter() this.canceledAt,
      @TimestampConverter() this.endAt,
      required this.entitlementID,
      required this.method,
      required this.periodType,
      required this.productID,
      required this.status,
      required this.transactionID,
      @TimestampConverter() this.updateAt})
      : super._();

  factory _$_Subscriber.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriberFromJson(json);

  @override
  @TimestampConverter()
  final DateTime? canceledAt;
  @override
  @TimestampConverter()
  final DateTime? endAt;
  @override
  final String entitlementID;
  @override
  final String method;
  @override
  final String periodType;
  @override
  final String productID;
  @override
  final String status;
  @override
  final String transactionID;
  @override
  @TimestampConverter()
  final DateTime? updateAt;

  @override
  String toString() {
    return 'Subscriber(canceledAt: $canceledAt, endAt: $endAt, entitlementID: $entitlementID, method: $method, periodType: $periodType, productID: $productID, status: $status, transactionID: $transactionID, updateAt: $updateAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Subscriber &&
            const DeepCollectionEquality()
                .equals(other.canceledAt, canceledAt) &&
            const DeepCollectionEquality().equals(other.endAt, endAt) &&
            const DeepCollectionEquality()
                .equals(other.entitlementID, entitlementID) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality()
                .equals(other.periodType, periodType) &&
            const DeepCollectionEquality().equals(other.productID, productID) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.transactionID, transactionID) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(canceledAt),
      const DeepCollectionEquality().hash(endAt),
      const DeepCollectionEquality().hash(entitlementID),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(periodType),
      const DeepCollectionEquality().hash(productID),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(transactionID),
      const DeepCollectionEquality().hash(updateAt));

  @JsonKey(ignore: true)
  @override
  _$SubscriberCopyWith<_Subscriber> get copyWith =>
      __$SubscriberCopyWithImpl<_Subscriber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriberToJson(this);
  }
}

abstract class _Subscriber extends Subscriber {
  factory _Subscriber(
      {@TimestampConverter() DateTime? canceledAt,
      @TimestampConverter() DateTime? endAt,
      required String entitlementID,
      required String method,
      required String periodType,
      required String productID,
      required String status,
      required String transactionID,
      @TimestampConverter() DateTime? updateAt}) = _$_Subscriber;
  _Subscriber._() : super._();

  factory _Subscriber.fromJson(Map<String, dynamic> json) =
      _$_Subscriber.fromJson;

  @override
  @TimestampConverter()
  DateTime? get canceledAt;
  @override
  @TimestampConverter()
  DateTime? get endAt;
  @override
  String get entitlementID;
  @override
  String get method;
  @override
  String get periodType;
  @override
  String get productID;
  @override
  String get status;
  @override
  String get transactionID;
  @override
  @TimestampConverter()
  DateTime? get updateAt;
  @override
  @JsonKey(ignore: true)
  _$SubscriberCopyWith<_Subscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

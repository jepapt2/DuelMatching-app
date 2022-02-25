// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsersSearchTearOff {
  const _$UsersSearchTearOff();

  _UsersSearch call(
      {String sort = 'activeAt',
      String? playTitle,
      String? adress,
      bool? remoteDuel}) {
    return _UsersSearch(
      sort: sort,
      playTitle: playTitle,
      adress: adress,
      remoteDuel: remoteDuel,
    );
  }
}

/// @nodoc
const $UsersSearch = _$UsersSearchTearOff();

/// @nodoc
mixin _$UsersSearch {
  String get sort => throw _privateConstructorUsedError;
  String? get playTitle => throw _privateConstructorUsedError;
  String? get adress => throw _privateConstructorUsedError;
  bool? get remoteDuel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersSearchCopyWith<UsersSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersSearchCopyWith<$Res> {
  factory $UsersSearchCopyWith(
          UsersSearch value, $Res Function(UsersSearch) then) =
      _$UsersSearchCopyWithImpl<$Res>;
  $Res call({String sort, String? playTitle, String? adress, bool? remoteDuel});
}

/// @nodoc
class _$UsersSearchCopyWithImpl<$Res> implements $UsersSearchCopyWith<$Res> {
  _$UsersSearchCopyWithImpl(this._value, this._then);

  final UsersSearch _value;
  // ignore: unused_field
  final $Res Function(UsersSearch) _then;

  @override
  $Res call({
    Object? sort = freezed,
    Object? playTitle = freezed,
    Object? adress = freezed,
    Object? remoteDuel = freezed,
  }) {
    return _then(_value.copyWith(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteDuel: remoteDuel == freezed
          ? _value.remoteDuel
          : remoteDuel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UsersSearchCopyWith<$Res>
    implements $UsersSearchCopyWith<$Res> {
  factory _$UsersSearchCopyWith(
          _UsersSearch value, $Res Function(_UsersSearch) then) =
      __$UsersSearchCopyWithImpl<$Res>;
  @override
  $Res call({String sort, String? playTitle, String? adress, bool? remoteDuel});
}

/// @nodoc
class __$UsersSearchCopyWithImpl<$Res> extends _$UsersSearchCopyWithImpl<$Res>
    implements _$UsersSearchCopyWith<$Res> {
  __$UsersSearchCopyWithImpl(
      _UsersSearch _value, $Res Function(_UsersSearch) _then)
      : super(_value, (v) => _then(v as _UsersSearch));

  @override
  _UsersSearch get _value => super._value as _UsersSearch;

  @override
  $Res call({
    Object? sort = freezed,
    Object? playTitle = freezed,
    Object? adress = freezed,
    Object? remoteDuel = freezed,
  }) {
    return _then(_UsersSearch(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteDuel: remoteDuel == freezed
          ? _value.remoteDuel
          : remoteDuel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_UsersSearch extends _UsersSearch {
  _$_UsersSearch(
      {this.sort = 'activeAt', this.playTitle, this.adress, this.remoteDuel})
      : super._();

  @JsonKey()
  @override
  final String sort;
  @override
  final String? playTitle;
  @override
  final String? adress;
  @override
  final bool? remoteDuel;

  @override
  String toString() {
    return 'UsersSearch(sort: $sort, playTitle: $playTitle, adress: $adress, remoteDuel: $remoteDuel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersSearch &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            const DeepCollectionEquality().equals(other.playTitle, playTitle) &&
            const DeepCollectionEquality().equals(other.adress, adress) &&
            const DeepCollectionEquality()
                .equals(other.remoteDuel, remoteDuel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sort),
      const DeepCollectionEquality().hash(playTitle),
      const DeepCollectionEquality().hash(adress),
      const DeepCollectionEquality().hash(remoteDuel));

  @JsonKey(ignore: true)
  @override
  _$UsersSearchCopyWith<_UsersSearch> get copyWith =>
      __$UsersSearchCopyWithImpl<_UsersSearch>(this, _$identity);
}

abstract class _UsersSearch extends UsersSearch {
  factory _UsersSearch(
      {String sort,
      String? playTitle,
      String? adress,
      bool? remoteDuel}) = _$_UsersSearch;
  _UsersSearch._() : super._();

  @override
  String get sort;
  @override
  String? get playTitle;
  @override
  String? get adress;
  @override
  bool? get remoteDuel;
  @override
  @JsonKey(ignore: true)
  _$UsersSearchCopyWith<_UsersSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

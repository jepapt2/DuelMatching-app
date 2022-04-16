// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_view.dart';

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

/// @nodoc
class _$UsersFutureScrollTearOff {
  const _$UsersFutureScrollTearOff();

  _UsersFutureScroll call(
      {List<ProfileWithId>? list,
      required Query<Profile> query,
      required UsersSearch searchItem,
      ProfileWithId? lastDocument,
      bool loading = false,
      bool hitBottom = false}) {
    return _UsersFutureScroll(
      list: list,
      query: query,
      searchItem: searchItem,
      lastDocument: lastDocument,
      loading: loading,
      hitBottom: hitBottom,
    );
  }
}

/// @nodoc
const $UsersFutureScroll = _$UsersFutureScrollTearOff();

/// @nodoc
mixin _$UsersFutureScroll {
  List<ProfileWithId>? get list => throw _privateConstructorUsedError;
  Query<Profile> get query => throw _privateConstructorUsedError;
  UsersSearch get searchItem => throw _privateConstructorUsedError;
  ProfileWithId? get lastDocument => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get hitBottom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersFutureScrollCopyWith<UsersFutureScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersFutureScrollCopyWith<$Res> {
  factory $UsersFutureScrollCopyWith(
          UsersFutureScroll value, $Res Function(UsersFutureScroll) then) =
      _$UsersFutureScrollCopyWithImpl<$Res>;
  $Res call(
      {List<ProfileWithId>? list,
      Query<Profile> query,
      UsersSearch searchItem,
      ProfileWithId? lastDocument,
      bool loading,
      bool hitBottom});

  $UsersSearchCopyWith<$Res> get searchItem;
  $ProfileWithIdCopyWith<$Res>? get lastDocument;
}

/// @nodoc
class _$UsersFutureScrollCopyWithImpl<$Res>
    implements $UsersFutureScrollCopyWith<$Res> {
  _$UsersFutureScrollCopyWithImpl(this._value, this._then);

  final UsersFutureScroll _value;
  // ignore: unused_field
  final $Res Function(UsersFutureScroll) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? query = freezed,
    Object? searchItem = freezed,
    Object? lastDocument = freezed,
    Object? loading = freezed,
    Object? hitBottom = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProfileWithId>?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Profile>,
      searchItem: searchItem == freezed
          ? _value.searchItem
          : searchItem // ignore: cast_nullable_to_non_nullable
              as UsersSearch,
      lastDocument: lastDocument == freezed
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as ProfileWithId?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hitBottom: hitBottom == freezed
          ? _value.hitBottom
          : hitBottom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UsersSearchCopyWith<$Res> get searchItem {
    return $UsersSearchCopyWith<$Res>(_value.searchItem, (value) {
      return _then(_value.copyWith(searchItem: value));
    });
  }

  @override
  $ProfileWithIdCopyWith<$Res>? get lastDocument {
    if (_value.lastDocument == null) {
      return null;
    }

    return $ProfileWithIdCopyWith<$Res>(_value.lastDocument!, (value) {
      return _then(_value.copyWith(lastDocument: value));
    });
  }
}

/// @nodoc
abstract class _$UsersFutureScrollCopyWith<$Res>
    implements $UsersFutureScrollCopyWith<$Res> {
  factory _$UsersFutureScrollCopyWith(
          _UsersFutureScroll value, $Res Function(_UsersFutureScroll) then) =
      __$UsersFutureScrollCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ProfileWithId>? list,
      Query<Profile> query,
      UsersSearch searchItem,
      ProfileWithId? lastDocument,
      bool loading,
      bool hitBottom});

  @override
  $UsersSearchCopyWith<$Res> get searchItem;
  @override
  $ProfileWithIdCopyWith<$Res>? get lastDocument;
}

/// @nodoc
class __$UsersFutureScrollCopyWithImpl<$Res>
    extends _$UsersFutureScrollCopyWithImpl<$Res>
    implements _$UsersFutureScrollCopyWith<$Res> {
  __$UsersFutureScrollCopyWithImpl(
      _UsersFutureScroll _value, $Res Function(_UsersFutureScroll) _then)
      : super(_value, (v) => _then(v as _UsersFutureScroll));

  @override
  _UsersFutureScroll get _value => super._value as _UsersFutureScroll;

  @override
  $Res call({
    Object? list = freezed,
    Object? query = freezed,
    Object? searchItem = freezed,
    Object? lastDocument = freezed,
    Object? loading = freezed,
    Object? hitBottom = freezed,
  }) {
    return _then(_UsersFutureScroll(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProfileWithId>?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Profile>,
      searchItem: searchItem == freezed
          ? _value.searchItem
          : searchItem // ignore: cast_nullable_to_non_nullable
              as UsersSearch,
      lastDocument: lastDocument == freezed
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as ProfileWithId?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hitBottom: hitBottom == freezed
          ? _value.hitBottom
          : hitBottom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UsersFutureScroll extends _UsersFutureScroll {
  _$_UsersFutureScroll(
      {this.list,
      required this.query,
      required this.searchItem,
      this.lastDocument,
      this.loading = false,
      this.hitBottom = false})
      : super._();

  @override
  final List<ProfileWithId>? list;
  @override
  final Query<Profile> query;
  @override
  final UsersSearch searchItem;
  @override
  final ProfileWithId? lastDocument;
  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final bool hitBottom;

  @override
  String toString() {
    return 'UsersFutureScroll(list: $list, query: $query, searchItem: $searchItem, lastDocument: $lastDocument, loading: $loading, hitBottom: $hitBottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersFutureScroll &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality()
                .equals(other.searchItem, searchItem) &&
            const DeepCollectionEquality()
                .equals(other.lastDocument, lastDocument) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.hitBottom, hitBottom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(searchItem),
      const DeepCollectionEquality().hash(lastDocument),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(hitBottom));

  @JsonKey(ignore: true)
  @override
  _$UsersFutureScrollCopyWith<_UsersFutureScroll> get copyWith =>
      __$UsersFutureScrollCopyWithImpl<_UsersFutureScroll>(this, _$identity);
}

abstract class _UsersFutureScroll extends UsersFutureScroll {
  factory _UsersFutureScroll(
      {List<ProfileWithId>? list,
      required Query<Profile> query,
      required UsersSearch searchItem,
      ProfileWithId? lastDocument,
      bool loading,
      bool hitBottom}) = _$_UsersFutureScroll;
  _UsersFutureScroll._() : super._();

  @override
  List<ProfileWithId>? get list;
  @override
  Query<Profile> get query;
  @override
  UsersSearch get searchItem;
  @override
  ProfileWithId? get lastDocument;
  @override
  bool get loading;
  @override
  bool get hitBottom;
  @override
  @JsonKey(ignore: true)
  _$UsersFutureScrollCopyWith<_UsersFutureScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

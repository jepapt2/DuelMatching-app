// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recruits_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecruitsSearchTearOff {
  const _$RecruitsSearchTearOff();

  _RecruitsSearch call(
      {String sort = 'startDesc',
      String? playTitle,
      String? place,
      Timestamp? start,
      bool? friendOnly = false}) {
    return _RecruitsSearch(
      sort: sort,
      playTitle: playTitle,
      place: place,
      start: start,
      friendOnly: friendOnly,
    );
  }
}

/// @nodoc
const $RecruitsSearch = _$RecruitsSearchTearOff();

/// @nodoc
mixin _$RecruitsSearch {
  String get sort => throw _privateConstructorUsedError;
  String? get playTitle => throw _privateConstructorUsedError;
  String? get place => throw _privateConstructorUsedError;
  Timestamp? get start => throw _privateConstructorUsedError;
  bool? get friendOnly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecruitsSearchCopyWith<RecruitsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruitsSearchCopyWith<$Res> {
  factory $RecruitsSearchCopyWith(
          RecruitsSearch value, $Res Function(RecruitsSearch) then) =
      _$RecruitsSearchCopyWithImpl<$Res>;
  $Res call(
      {String sort,
      String? playTitle,
      String? place,
      Timestamp? start,
      bool? friendOnly});
}

/// @nodoc
class _$RecruitsSearchCopyWithImpl<$Res>
    implements $RecruitsSearchCopyWith<$Res> {
  _$RecruitsSearchCopyWithImpl(this._value, this._then);

  final RecruitsSearch _value;
  // ignore: unused_field
  final $Res Function(RecruitsSearch) _then;

  @override
  $Res call({
    Object? sort = freezed,
    Object? playTitle = freezed,
    Object? place = freezed,
    Object? start = freezed,
    Object? friendOnly = freezed,
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
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      friendOnly: friendOnly == freezed
          ? _value.friendOnly
          : friendOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$RecruitsSearchCopyWith<$Res>
    implements $RecruitsSearchCopyWith<$Res> {
  factory _$RecruitsSearchCopyWith(
          _RecruitsSearch value, $Res Function(_RecruitsSearch) then) =
      __$RecruitsSearchCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sort,
      String? playTitle,
      String? place,
      Timestamp? start,
      bool? friendOnly});
}

/// @nodoc
class __$RecruitsSearchCopyWithImpl<$Res>
    extends _$RecruitsSearchCopyWithImpl<$Res>
    implements _$RecruitsSearchCopyWith<$Res> {
  __$RecruitsSearchCopyWithImpl(
      _RecruitsSearch _value, $Res Function(_RecruitsSearch) _then)
      : super(_value, (v) => _then(v as _RecruitsSearch));

  @override
  _RecruitsSearch get _value => super._value as _RecruitsSearch;

  @override
  $Res call({
    Object? sort = freezed,
    Object? playTitle = freezed,
    Object? place = freezed,
    Object? start = freezed,
    Object? friendOnly = freezed,
  }) {
    return _then(_RecruitsSearch(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      playTitle: playTitle == freezed
          ? _value.playTitle
          : playTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      friendOnly: friendOnly == freezed
          ? _value.friendOnly
          : friendOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_RecruitsSearch extends _RecruitsSearch {
  _$_RecruitsSearch(
      {this.sort = 'startDesc',
      this.playTitle,
      this.place,
      this.start,
      this.friendOnly = false})
      : super._();

  @JsonKey()
  @override
  final String sort;
  @override
  final String? playTitle;
  @override
  final String? place;
  @override
  final Timestamp? start;
  @JsonKey()
  @override
  final bool? friendOnly;

  @override
  String toString() {
    return 'RecruitsSearch(sort: $sort, playTitle: $playTitle, place: $place, start: $start, friendOnly: $friendOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecruitsSearch &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            const DeepCollectionEquality().equals(other.playTitle, playTitle) &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality()
                .equals(other.friendOnly, friendOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sort),
      const DeepCollectionEquality().hash(playTitle),
      const DeepCollectionEquality().hash(place),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(friendOnly));

  @JsonKey(ignore: true)
  @override
  _$RecruitsSearchCopyWith<_RecruitsSearch> get copyWith =>
      __$RecruitsSearchCopyWithImpl<_RecruitsSearch>(this, _$identity);
}

abstract class _RecruitsSearch extends RecruitsSearch {
  factory _RecruitsSearch(
      {String sort,
      String? playTitle,
      String? place,
      Timestamp? start,
      bool? friendOnly}) = _$_RecruitsSearch;
  _RecruitsSearch._() : super._();

  @override
  String get sort;
  @override
  String? get playTitle;
  @override
  String? get place;
  @override
  Timestamp? get start;
  @override
  bool? get friendOnly;
  @override
  @JsonKey(ignore: true)
  _$RecruitsSearchCopyWith<_RecruitsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RecruitsFutureScrollTearOff {
  const _$RecruitsFutureScrollTearOff();

  _RecruitsFutureScroll call(
      {List<RecruitWithId>? list,
      required Query<Recruit> query,
      required RecruitsSearch searchItem,
      RecruitWithId? lastDocument,
      bool loading = false,
      bool hitBottom = false,
      bool error = false}) {
    return _RecruitsFutureScroll(
      list: list,
      query: query,
      searchItem: searchItem,
      lastDocument: lastDocument,
      loading: loading,
      hitBottom: hitBottom,
      error: error,
    );
  }
}

/// @nodoc
const $RecruitsFutureScroll = _$RecruitsFutureScrollTearOff();

/// @nodoc
mixin _$RecruitsFutureScroll {
  List<RecruitWithId>? get list => throw _privateConstructorUsedError;
  Query<Recruit> get query => throw _privateConstructorUsedError;
  RecruitsSearch get searchItem => throw _privateConstructorUsedError;
  RecruitWithId? get lastDocument => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get hitBottom => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecruitsFutureScrollCopyWith<RecruitsFutureScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruitsFutureScrollCopyWith<$Res> {
  factory $RecruitsFutureScrollCopyWith(RecruitsFutureScroll value,
          $Res Function(RecruitsFutureScroll) then) =
      _$RecruitsFutureScrollCopyWithImpl<$Res>;
  $Res call(
      {List<RecruitWithId>? list,
      Query<Recruit> query,
      RecruitsSearch searchItem,
      RecruitWithId? lastDocument,
      bool loading,
      bool hitBottom,
      bool error});

  $RecruitsSearchCopyWith<$Res> get searchItem;
  $RecruitWithIdCopyWith<$Res>? get lastDocument;
}

/// @nodoc
class _$RecruitsFutureScrollCopyWithImpl<$Res>
    implements $RecruitsFutureScrollCopyWith<$Res> {
  _$RecruitsFutureScrollCopyWithImpl(this._value, this._then);

  final RecruitsFutureScroll _value;
  // ignore: unused_field
  final $Res Function(RecruitsFutureScroll) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? query = freezed,
    Object? searchItem = freezed,
    Object? lastDocument = freezed,
    Object? loading = freezed,
    Object? hitBottom = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RecruitWithId>?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Recruit>,
      searchItem: searchItem == freezed
          ? _value.searchItem
          : searchItem // ignore: cast_nullable_to_non_nullable
              as RecruitsSearch,
      lastDocument: lastDocument == freezed
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as RecruitWithId?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hitBottom: hitBottom == freezed
          ? _value.hitBottom
          : hitBottom // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $RecruitsSearchCopyWith<$Res> get searchItem {
    return $RecruitsSearchCopyWith<$Res>(_value.searchItem, (value) {
      return _then(_value.copyWith(searchItem: value));
    });
  }

  @override
  $RecruitWithIdCopyWith<$Res>? get lastDocument {
    if (_value.lastDocument == null) {
      return null;
    }

    return $RecruitWithIdCopyWith<$Res>(_value.lastDocument!, (value) {
      return _then(_value.copyWith(lastDocument: value));
    });
  }
}

/// @nodoc
abstract class _$RecruitsFutureScrollCopyWith<$Res>
    implements $RecruitsFutureScrollCopyWith<$Res> {
  factory _$RecruitsFutureScrollCopyWith(_RecruitsFutureScroll value,
          $Res Function(_RecruitsFutureScroll) then) =
      __$RecruitsFutureScrollCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<RecruitWithId>? list,
      Query<Recruit> query,
      RecruitsSearch searchItem,
      RecruitWithId? lastDocument,
      bool loading,
      bool hitBottom,
      bool error});

  @override
  $RecruitsSearchCopyWith<$Res> get searchItem;
  @override
  $RecruitWithIdCopyWith<$Res>? get lastDocument;
}

/// @nodoc
class __$RecruitsFutureScrollCopyWithImpl<$Res>
    extends _$RecruitsFutureScrollCopyWithImpl<$Res>
    implements _$RecruitsFutureScrollCopyWith<$Res> {
  __$RecruitsFutureScrollCopyWithImpl(
      _RecruitsFutureScroll _value, $Res Function(_RecruitsFutureScroll) _then)
      : super(_value, (v) => _then(v as _RecruitsFutureScroll));

  @override
  _RecruitsFutureScroll get _value => super._value as _RecruitsFutureScroll;

  @override
  $Res call({
    Object? list = freezed,
    Object? query = freezed,
    Object? searchItem = freezed,
    Object? lastDocument = freezed,
    Object? loading = freezed,
    Object? hitBottom = freezed,
    Object? error = freezed,
  }) {
    return _then(_RecruitsFutureScroll(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RecruitWithId>?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Recruit>,
      searchItem: searchItem == freezed
          ? _value.searchItem
          : searchItem // ignore: cast_nullable_to_non_nullable
              as RecruitsSearch,
      lastDocument: lastDocument == freezed
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as RecruitWithId?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hitBottom: hitBottom == freezed
          ? _value.hitBottom
          : hitBottom // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RecruitsFutureScroll extends _RecruitsFutureScroll {
  _$_RecruitsFutureScroll(
      {this.list,
      required this.query,
      required this.searchItem,
      this.lastDocument,
      this.loading = false,
      this.hitBottom = false,
      this.error = false})
      : super._();

  @override
  final List<RecruitWithId>? list;
  @override
  final Query<Recruit> query;
  @override
  final RecruitsSearch searchItem;
  @override
  final RecruitWithId? lastDocument;
  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final bool hitBottom;
  @JsonKey()
  @override
  final bool error;

  @override
  String toString() {
    return 'RecruitsFutureScroll(list: $list, query: $query, searchItem: $searchItem, lastDocument: $lastDocument, loading: $loading, hitBottom: $hitBottom, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecruitsFutureScroll &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality()
                .equals(other.searchItem, searchItem) &&
            const DeepCollectionEquality()
                .equals(other.lastDocument, lastDocument) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.hitBottom, hitBottom) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(searchItem),
      const DeepCollectionEquality().hash(lastDocument),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(hitBottom),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$RecruitsFutureScrollCopyWith<_RecruitsFutureScroll> get copyWith =>
      __$RecruitsFutureScrollCopyWithImpl<_RecruitsFutureScroll>(
          this, _$identity);
}

abstract class _RecruitsFutureScroll extends RecruitsFutureScroll {
  factory _RecruitsFutureScroll(
      {List<RecruitWithId>? list,
      required Query<Recruit> query,
      required RecruitsSearch searchItem,
      RecruitWithId? lastDocument,
      bool loading,
      bool hitBottom,
      bool error}) = _$_RecruitsFutureScroll;
  _RecruitsFutureScroll._() : super._();

  @override
  List<RecruitWithId>? get list;
  @override
  Query<Recruit> get query;
  @override
  RecruitsSearch get searchItem;
  @override
  RecruitWithId? get lastDocument;
  @override
  bool get loading;
  @override
  bool get hitBottom;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$RecruitsFutureScrollCopyWith<_RecruitsFutureScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

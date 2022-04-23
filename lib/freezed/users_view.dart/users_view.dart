import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_view.freezed.dart';

@freezed
class UsersSearch with _$UsersSearch {
  factory UsersSearch({
    @Default('activeAt') String sort,
    String? playTitle,
    String? adress,
    bool? remoteDuel,
  }) = _UsersSearch;

  const UsersSearch._();
}

@freezed
class UsersFutureScroll with _$UsersFutureScroll {
  factory UsersFutureScroll({
    List<ProfileWithId>? list,
    required final Query<Profile> query,
    required final UsersSearch searchItem,
    ProfileWithId? lastDocument,
    @Default(false) bool loading,
    @Default(false) bool hitBottom,
    @Default(false) bool error,
  }) = _UsersFutureScroll;

  const UsersFutureScroll._();
}

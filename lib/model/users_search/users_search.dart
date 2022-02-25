import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_search.freezed.dart';

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

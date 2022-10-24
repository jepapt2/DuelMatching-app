import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/freezed/users_view.dart/users_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

final usersFutureScrollProvider =
    StateNotifierProvider<UsersFutureScrollNotifier, UsersFutureScroll>(
        (ref) => UsersFutureScrollNotifier());

class UsersFutureScrollNotifier extends StateNotifier<UsersFutureScroll> {
  UsersFutureScrollNotifier()
      : super(UsersFutureScroll(
            query: userCollection().orderBy('activeAt', descending: true),
            searchItem: UsersSearch(sort: 'activeAt')));

  Future<void> loadUsers(List<String>? hideIds) async {
    if (state.loading || state.hitBottom) {
      return;
    }
    state = state.copyWith(loading: true, error: false);

    if (state.lastDocument != null) {
      try {
        QuerySnapshot<Profile> document;

        if (state.searchItem.sort == 'activeAt') {
          document = await state.query
              .startAfter([state.lastDocument!.profile.activeAt])
              .limit(10)
              .get();
        } else if (state.searchItem.sort == 'createdAtDesc') {
          document = await state.query
              .startAfter([state.lastDocument!.profile.createdAt])
              .limit(10)
              .get();
        } else {
          document = await state.query
              .endBefore([state.lastDocument!.profile.createdAt])
              .limit(10)
              .get();
        }

        List<ProfileWithId> getList = document.docs
            .map((e) => ProfileWithId(id: e.id, profile: e.data()))
            .toList();
        List<ProfileWithId> organizedList;
        if (hideIds != null && hideIds.isNotEmpty) {
          organizedList = getList
              .where((element) => !hideIds.contains(element.id))
              .toList();
        } else {
          organizedList = getList;
        }

        organizedList = organizedList
            .where((u) =>
                u.profile.playTitle != null && u.profile.playTitle!.isNotEmpty)
            .toList();

        state = state.copyWith(
            list: [...?state.list, ...organizedList].toSet().toList(),
            lastDocument: organizedList.isNotEmpty
                ? organizedList.last
                : state.list!.last,
            hitBottom: getList.length < 10,
            loading: false);
      } catch (_) {
        state = state.copyWith(
            error: true,
            list: null,
            lastDocument: null,
            hitBottom: false,
            loading: false);
      }
    } else {
      try {
        QuerySnapshot<Profile> document = await state.query.limit(21).get();
        List<ProfileWithId> getList = document.docs
            .map((e) => ProfileWithId(id: e.id, profile: e.data()))
            .toList();
        List<ProfileWithId> organizedList;
        if (hideIds != null && hideIds.isNotEmpty) {
          organizedList = getList
              .where((element) => !hideIds.contains(element.id))
              .toList();
        } else {
          organizedList = getList;
        }
        organizedList = organizedList
            .where((u) =>
                u.profile.playTitle != null && u.profile.playTitle!.isNotEmpty)
            .toList();
        state = state.copyWith(
            list: [...organizedList].toSet().toList(),
            lastDocument: getList.isNotEmpty ? getList.last : null,
            hitBottom: getList.length < 10,
            loading: false);
      } catch (_) {
        state = state.copyWith(
            error: true,
            list: null,
            lastDocument: null,
            hitBottom: false,
            loading: false);
      }
    }
  }

  void searchUsers(UsersSearch search, List<String>? hideIds) {
    state = state.copyWith(list: null, lastDocument: null, searchItem: search);
    Query<Profile> searchUser;
    if (search.sort == 'activeAt') {
      searchUser = userCollection().orderBy('activeAt', descending: true);
    } else if (search.sort == 'createdAtDesc') {
      searchUser = userCollection().orderBy('createdAt', descending: true);
    } else if (search.sort == 'createdAtAsc') {
      searchUser = userCollection().orderBy('createdAt');
    } else {
      searchUser = userCollection().orderBy('activeAt', descending: true);
    }

    if (search.playTitle.isNotNullAndNotEmpty) {
      searchUser =
          searchUser.where('playTitle', arrayContains: search.playTitle);
    }

    if (search.adress.isNotNullAndNotEmpty) {
      searchUser = searchUser.where('adress', isEqualTo: search.adress);
    }

    if (search.remoteDuel != null && search.remoteDuel!) {
      searchUser = searchUser.where('remoteDuel', isEqualTo: true);
    }
    state = state.copyWith(query: searchUser, hitBottom: false);

    loadUsers(hideIds);
  }

  Future<void> refreshUsers(List<String>? hideIds) async {
    state = state.copyWith(
        list: null, lastDocument: null, hitBottom: false, error: false);
    loadUsers(hideIds);
  }
}

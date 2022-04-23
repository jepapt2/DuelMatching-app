import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/recruits_view/recruits_view.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/freezed/users_view.dart/users_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

final recruitsFutureScrollProvider =
    StateNotifierProvider<RecruitsFutureScrollNotifier, RecruitsFutureScroll>(
        (ref) => RecruitsFutureScrollNotifier());

class RecruitsFutureScrollNotifier extends StateNotifier<RecruitsFutureScroll> {
  RecruitsFutureScrollNotifier()
      : super(RecruitsFutureScroll(
          query: recruitsCollection()
              .orderBy('start', descending: true)
              .where('close', isEqualTo: false)
              .where('full', isEqualTo: false)
              .where('cancel', isEqualTo: false)
              .where('friendOnly', isEqualTo: false),
          searchItem: RecruitsSearch(sort: 'startDesc'),
        ));

  Future<void> loadRecruits(DateTime time) async {
    if (state.loading || state.hitBottom) {
      return;
    }
    state = state.copyWith(loading: true, error: false);

    if (state.lastDocument != null) {
      try {
        QuerySnapshot<Recruit> document;
        if (state.searchItem.sort == 'limitDesc') {
          document = await state.query
              .startAfter([state.lastDocument!.recruit.limit])
              .limit(10)
              .get();
        } else if (state.searchItem.sort == 'createdAtDesc') {
          document = await state.query
              .startAfter([state.lastDocument!.recruit.createdAt])
              .limit(10)
              .get();
        } else {
          document = await state.query
              .endBefore([state.lastDocument!.recruit.createdAt])
              .limit(10)
              .get();
        }
        List<RecruitWithId> getList = document.docs
            .map((e) => RecruitWithId(id: e.id, recruit: e.data()))
            .toList();
        List<RecruitWithId> organizedList;

        organizedList = getList
            .where((element) => element.recruit.limit!.isAfter(time))
            .toList();

        state = state.copyWith(
            list: [...?state.list, ...organizedList],
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
        QuerySnapshot<Recruit> document = await state.query.limit(10).get();
        List<RecruitWithId> getList = document.docs
            .map((e) => RecruitWithId(id: e.id, recruit: e.data()))
            .toList();
        List<RecruitWithId> organizedList;
        organizedList = getList
            .where((element) => element.recruit.limit!.isAfter(time))
            .toList();
        state = state.copyWith(
            list: [...organizedList],
            lastDocument: organizedList.isNotEmpty ? organizedList.last : null,
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

  void searchRecruits(RecruitsSearch search, DateTime time) {
    state = state.copyWith(list: null, lastDocument: null, searchItem: search);
    Query<Recruit> searchRecruit;

    if (search.sort == 'startDesc') {
      searchRecruit = recruitsCollection().orderBy('start', descending: true);
    } else if (search.sort == 'startAsc') {
      searchRecruit = recruitsCollection().orderBy('start');
    } else if (search.sort == 'limitDesc') {
      searchRecruit = recruitsCollection().orderBy('limit', descending: true);
    } else if (search.sort == 'limitAsc') {
      searchRecruit = recruitsCollection().orderBy('limit');
    } else if (search.sort == 'createdAtDesc') {
      searchRecruit =
          recruitsCollection().orderBy('createdAt', descending: true);
    } else {
      searchRecruit = recruitsCollection().orderBy('createdAt');
    }

    if (search.start != null &&
        (search.sort == 'startDesc' || search.sort == 'startAsc')) {
      Timestamp startTomorrow = Timestamp.fromDate(search.start!
          .toDate()
          .add(const Duration(days: 1))
          .add(const Duration(minutes: 1) * -1));
      searchRecruit = searchRecruit
          .where('start', isGreaterThanOrEqualTo: search.start)
          .where('start', isLessThanOrEqualTo: startTomorrow);
    }

    searchRecruit = searchRecruit
        .where('close', isEqualTo: false)
        .where('full', isEqualTo: false)
        .where('cancel', isEqualTo: false);

    if (search.playTitle.isNotNullAndNotEmpty) {
      searchRecruit =
          searchRecruit.where('playTitle', isEqualTo: search.playTitle);
    }

    if (search.place.isNotNullAndNotEmpty) {
      searchRecruit = searchRecruit.where('place', isEqualTo: search.place);
    }

    if (search.friendOnly != null) {
      searchRecruit =
          searchRecruit.where('friendOnly', isEqualTo: search.friendOnly);
    }
    state = state.copyWith(query: searchRecruit, hitBottom: false);

    loadRecruits(time);
  }

  Future<void> recruitsRefresh(DateTime time) async {
    state = state.copyWith(
        list: null, lastDocument: null, hitBottom: false, error: false);
    loadRecruits(time);
  }
}

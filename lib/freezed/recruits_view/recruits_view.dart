import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'recruits_view.freezed.dart';

@freezed
class RecruitsSearch with _$RecruitsSearch {
  factory RecruitsSearch({
    @Default('startDesc') String sort,
    String? playTitle,
    String? place,
    Timestamp? start,
    @Default(false) bool? friendOnly,
  }) = _RecruitsSearch;

  const RecruitsSearch._();
}

@freezed
class RecruitsFutureScroll with _$RecruitsFutureScroll {
  factory RecruitsFutureScroll({
    List<RecruitWithId>? list,
    required final Query<Recruit> query,
    required final RecruitsSearch searchItem,
    RecruitWithId? lastDocument,
    @Default(false) bool loading,
    @Default(false) bool hitBottom,
    @Default(false) bool error,
  }) = _RecruitsFutureScroll;

  const RecruitsFutureScroll._();
}

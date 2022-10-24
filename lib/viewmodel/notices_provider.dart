import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final noticesProvider =
    StreamProvider.family.autoDispose<List<NoticeWithId>, String>((ref, id) {
  final document = noticeCollection(id)
      .where('type', whereIn: [
        'friendRequest',
        'newFriend',
        'createRecruit',
        'recruitCancel'
      ])
      .orderBy('updateAt', descending: true)
      .limit(100);
  final snapshot = document.snapshots();
  final collection = snapshot.map((e) =>
      e.docs.map((e) => NoticeWithId(id: e.id, notice: e.data())).toList());
  return collection;
});

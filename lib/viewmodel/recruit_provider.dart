import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/member/member.dart';
import 'package:duel_matching/model/recruit/recruit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recruitProvider =
    StreamProvider.family.autoDispose<Recruit, String>((ref, id) {
  final document = recruitDocument(id);
  final snapshot = document.snapshots();
  final doc = snapshot.map((event) => event.data()!);
  return doc;
});

final membersProvider =
    StreamProvider.family.autoDispose<List<Member>, String>((ref, id) {
  final document = membersCollection(id);
  final snapshot = document.snapshots();
  final collection = snapshot.map((e) => e.docs.map((e) => e.data()).toList());
  return collection;
});

final recruitsQueryProvider =
    StateProvider.family.autoDispose<Query<Recruit>, DateTime>((ref, time) {
  Query<Recruit> searchRecruit = recruitsCollection()
      .where('full', isEqualTo: false)
      .where('cancel', isEqualTo: false)
      .where('limit', isLessThan: time);

  return searchRecruit;
});

class RecruitWhenConsumer extends HookConsumerWidget {
  const RecruitWhenConsumer({Key? key, required this.id, required this.child})
      : super(key: key);

  final String id;
  final Widget Function(Recruit) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruit = ref.watch(recruitProvider(id));

    return recruit.when(
        data: (recruit) => child(recruit),
        error: (error, stack) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('データの取得に失敗しました'),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      child: const Text('更新する'),
                      onPressed: () {
                        ref.refresh(recruitProvider(id));
                      },
                    ),
                  ],
                ),
              ),
            ),
        loading: () => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ));
  }
}

class MembersWhenConsumer extends HookConsumerWidget {
  const MembersWhenConsumer({Key? key, required this.id, required this.child})
      : super(key: key);

  final String id;
  final Widget Function(List<Member>) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruit = ref.watch(membersProvider(id));

    return recruit.when(
        data: (members) => child(members),
        error: (error, stack) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('データの取得に失敗しました'),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      child: const Text('更新する'),
                      onPressed: () {
                        ref.refresh(recruitProvider(id));
                      },
                    ),
                  ],
                ),
              ),
            ),
        loading: () => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ));
  }
}

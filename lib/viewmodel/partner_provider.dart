import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../freezed/chat_room/chat_room.dart';

final partnersProvider =
    StreamProvider.family.autoDispose<List<Partner>, String>((ref, id) {
  final document = partnerCollection(id);
  final snapshot = document.snapshots();
  final collection = snapshot.map((e) => e.docs.map((e) => e.data()).toList());
  return collection;
});

class PartnersWhenConsumer extends HookConsumerWidget {
  const PartnersWhenConsumer({Key? key, required this.id, required this.child})
      : super(key: key);

  final String id;
  final Widget Function(List<Partner>) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partners = ref.watch(partnersProvider(id));

    return partners.when(
        data: (partners) => child(partners),
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
                        ref.refresh(partnersProvider(id));
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

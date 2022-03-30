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

class UserWhenConsumer extends HookConsumerWidget {
  const UserWhenConsumer({Key? key, required this.id, required this.child})
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

import 'package:duel_matching/freezed/subscriber/subscriber.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final subscriberProvider =
    StreamProvider.family<Subscriber?, String>((ref, id) {
  final document = subscriberDocument(id);
  final snapshot = document.snapshots();
  final doc = snapshot.map((event) => event.data());
  return doc;
});

class SubscriberWhenConsumer extends HookConsumerWidget {
  const SubscriberWhenConsumer(
      {Key? key, required this.id, required this.child})
      : super(key: key);

  final String id;
  final Widget Function(bool) child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruit = ref.watch(subscriberProvider(id));
    final isSubscriber = !(recruit.value == null ||
        recruit.value!.endAt!.isBefore(DateTime.now()));

    return recruit.when(
        data: (recruit) => child(isSubscriber),
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
                        ref.refresh(subscriberProvider(id));
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

import 'package:duel_matching/parts/message_cards.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:duel_matching/viewmodel/messages_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nowTime = useMemoized(DateTime.now);
    final messagesRef = ref.watch(messagesProvider(firebaseCurrentUserId));

    return UserWhenConsumer(child: (user) {
      return messagesRef.when(
          data: (messages) => SafeArea(
                child: PrimaryScaffold(
                    pageIndex: 2,
                    child: CustomScrollView(
                      slivers: [
                        PrimarySliverAppBar(
                          user: user,
                          appBarText: 'メッセージ',
                          appBarAction: const [],
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          if (messages.isEmpty)
                            Center(
                                child: Column(
                              children: const [
                                SizedBox(
                                  height: 100.0,
                                ),
                                Text('まだ通知はありません'),
                              ],
                            ))
                          else
                            const SizedBox(height: 16.0),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 2.0),
                                        child: MessageCard(
                                          id: messages[index].id,
                                          notice: messages[index].notice,
                                          nowTime: nowTime,
                                        )),
                                    const Divider()
                                  ],
                                );
                              }),
                        ]))
                      ],
                    ),
                    user: user),
              ),
          error: (error, _) => Scaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      const Text('通知の取得に失敗しました'),
                      ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontWeight: FontWeight.bold)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent)),
                        child: const Text('更新する'),
                        onPressed: () {
                          GoRouter.of(context).go('/messages');
                        },
                      ),
                    ],
                  ),
                ),
              ),
          loading: () => Scaffold(
                body: Center(
                    child: Column(
                  children: const [
                    SizedBox(
                      height: 100.0,
                    ),
                    CircularProgressIndicator(),
                  ],
                )),
              ));
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/parts/notice_cards.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:duel_matching/viewmodel/notices_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoticeScreen extends HookConsumerWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nowTime = useMemoized(DateTime.now);

    final noticesRef = ref.watch(noticesProvider(firebaseCurrentUserId));
    return UserWhenConsumer(child: (user) {
      return noticesRef.when(
          data: (notices) {
            //通知の既読処理
            useEffect(() {
              Future.delayed(Duration.zero, () {
                var batch = FirebaseFirestore.instance.batch();
                //未読の通知だけ抽出
                List<NoticeWithId> unReadNotices =
                    notices.where((n) => n.notice.unReadCount <= 1).toList();
                //すべて既読に
                for (var notice in unReadNotices) {
                  batch.update(
                      noticeCollection(firebaseCurrentUserId).doc(notice.id),
                      {'unReadCount': 0});
                }
                batch.commit();
              });
              return null;
            }, []);
            return PrimaryScaffold(
                pageIndex: 3,
                child: CustomScrollView(
                  slivers: [
                    PrimarySliverAppBar(
                      user: user,
                      appBarText: '通知',
                      appBarAction: const [],
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      if (notices.isEmpty)
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
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: notices.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 2.0),
                                        child: NoticeCard(
                                          id: notices[index].id,
                                          notice: notices[index].notice,
                                          nowTime: nowTime,
                                        )),
                                    const Divider()
                                  ],
                                );
                              }),
                        ),
                    ]))
                  ],
                ),
                user: user);
          },
          error: (error, _) {
            return Scaffold(
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
                        GoRouter.of(context).go('/notice');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
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

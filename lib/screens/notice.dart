import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/notice_cards.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoticeScreen extends HookConsumerWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nowTime = useMemoized(DateTime.now);

    useEffect(() {
      userDocument(FirebaseAuth.instance.currentUser!.uid)
          .update({'readNoticeAt': DateTime.now()});
    }, []);

    return UserWhenConsumer(child: (user) {
      return PrimaryScaffold(
          child: RefreshIndicator(
            onRefresh: Future.value,
            child: CustomScrollView(
              slivers: [
                PrimarySliverAppBar(user: user),
                SliverList(
                    delegate: SliverChildListDelegate([
                  FirestoreListView(
                    query:
                        noticeCollection(FirebaseAuth.instance.currentUser!.uid)
                            .orderBy('updateAt', descending: true),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:
                        (context, QueryDocumentSnapshot<Notice> snapshot) {
                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2.0),
                              child: NoticeCard(
                                id: snapshot.id,
                                notice: snapshot.data(),
                                nowTime: nowTime,
                              )),
                          const Divider()
                        ],
                      );
                      // if (snapshot.data()) {
                      //   return Center(
                      //     child: Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: const [
                      //         SizedBox(
                      //           height: 100.0,
                      //         ),
                      //         Text('ユーザが見つかりませんでした'),
                      //       ],
                      //     ),
                      //   );
                      // }
                    },
                    loadingBuilder: (context) => Center(
                        child: Column(
                      children: const [
                        SizedBox(
                          height: 100.0,
                        ),
                        CircularProgressIndicator(),
                      ],
                    )),
                    errorBuilder: (context, error, _) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 100.0,
                          ),
                          const Text('ユーザの取得に失敗しました'),
                          ElevatedButton(
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                            child: const Text('更新する'),
                            onPressed: () {
                              GoRouter.of(context).pop();
                              GoRouter.of(context).push('/block');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ]))
              ],
            ),
          ),
          user: user);
    });
  }
}

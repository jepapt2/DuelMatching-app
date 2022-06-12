import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

class JoinedRecruitScreen extends HookConsumerWidget {
  const JoinedRecruitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserWhenConsumer(
      child: (user) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('参加済の対戦募集'),
          ),
          body: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FirestoreQueryBuilder(
                  query: recruitsCollection()
                      .where('membersId',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid)
                      .orderBy('start', descending: true),
                  builder: (context,
                      FirestoreQueryBuilderSnapshot<Recruit> snapshot, _) {
                    if (snapshot.docs.isEmpty) {
                      return const Center(child: Text('まだ対戦募集に参加していません'));
                    }
                    if (snapshot.isFetching) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('募集の取得に失敗しました'),
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
                                GoRouter.of(context).push('/joined');
                              },
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.docs.length,
                        itemBuilder: (context, index) {
                          if (snapshot.hasMore &&
                              index + 1 == snapshot.docs.length) {
                            snapshot.fetchMore();
                          }
                          Recruit recruit = snapshot.docs[index].data();
                          String recruitId = snapshot.docs[index].id;
                          return InkWell(
                            onTap: () => GoRouter.of(context)
                                .push('/recruit/$recruitId'),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  child: InkWell(
                                    onTap: () => GoRouter.of(context)
                                        .push('/recruit/$recruitId'),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  recruit.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Visibility(
                                                      visible:
                                                          recruit.organizerId ==
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid,
                                                      child: const Text(
                                                        '主催者',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      DateTime.now().isAfter(
                                                              recruit.start!)
                                                          ? '開催前'
                                                          : '開催終了',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      DateTime.now().isAfter(
                                                              recruit.limit!)
                                                          ? '募集中'
                                                          : '募集終了',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black54),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        ElevatedButton(
                                            onPressed: () =>
                                                GoRouter.of(context)
                                                    .push('/group/$recruitId'),
                                            child: const Icon(
                                              Icons.message,
                                              size: 20.0,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(40, 36),
                                                maximumSize: const Size(40, 36),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0))),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        });
                  })),
        );
      },
    );
  }
}

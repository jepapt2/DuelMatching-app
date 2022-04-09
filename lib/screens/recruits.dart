import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/model/recruit/recruit.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/model/users_search/users_search.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/recruit_card.dart';
import 'package:duel_matching/parts/search_button.dart';
import 'package:duel_matching/parts/user_card.dart';
import 'package:duel_matching/viewmodel/recruit_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:duel_matching/viewmodel/users_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecruitsScreen extends HookConsumerWidget {
  RecruitsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNow = useMemoized(DateTime.now);
    final searchQuery = useState<UsersSearch>(UsersSearch(
      sort: 'activeAt',
    ));

    final recruitsQuery = useState(recruitsCollection()
        .orderBy('createdAt', descending: false)
        .orderBy('limit')
        .where('full', isEqualTo: false)
        .where('cancel', isEqualTo: false));

    return UserWhenConsumer(
      child: (myProfile) => FriendsWhenConsumer(child: (friends) {
        return PrimaryScaffold(
          user: myProfile,
          appBarAction: [
            IconButton(
                iconSize: 33,
                onPressed: () => searchDialog(
                    context, ref, searchQuery, recruitsQuery, timeNow),
                icon: const Icon(Icons.manage_search_outlined))
          ],
          sliverChild: SliverList(
            delegate: SliverChildListDelegate(
              [
                FirestoreListView(
                  query: recruitsQuery.value,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, QueryDocumentSnapshot<Recruit> snapshot) =>
                          Column(
                    children: [
                      RecruitCard(
                          title: snapshot.data().title,
                          playTitle: snapshot.data().playTitle,
                          format: snapshot.data().format,
                          place: snapshot.data().place,
                          point: snapshot.data().point,
                          start: snapshot.data().start!,
                          end: snapshot.data().end,
                          reqruitNumber: snapshot.data().recruitNumber,
                          memberCount: snapshot.data().memberCount),
                      const Divider()
                    ],
                  ),
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
                        const Text('対戦募集の取得に失敗しました'),
                        ElevatedButton(
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontWeight: FontWeight.bold)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent)),
                          child: const Text('更新する'),
                          onPressed: () {
                            GoRouter.of(context).pop();
                            GoRouter.of(context).push('/recruits');
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Color(0xfffffffe),
            ),
            onPressed: () => GoRouter.of(context).push('/recruit_new'),
          ),
        );
      }),
    );
  }

  searchDialog(context, WidgetRef ref, ValueNotifier<UsersSearch> searchQuery,
      ValueNotifier<Query<Recruit>> recruitsQuery, DateTime time) {
    BuildContext innerContext;
    getRecruitsQuery() {
      // if (search.value.sort == 'activeAt') {
      //   searchUser = userCollection().orderBy('activeAt', descending: true);
      // } else if (search.value.sort == 'createdAtDesc') {
      //   searchUser = userCollection().orderBy('createdAt', descending: true);
      // } else if (search.value.sort == 'createdAtAsc') {
      //   searchUser = userCollection().orderBy('createdAt');
      // } else {
      //   searchUser = userCollection().orderBy('activeAt', descending: true);
      // }

      // if (search.value.playTitle.isNotNullAndNotEmpty) {
      //   searchUser =
      //       searchUser.where('playTitle', arrayContains: search.value.playTitle);
      // }

      // if (search.value.adress.isNotNullAndNotEmpty) {
      //   searchUser = searchUser.where('adress', isEqualTo: search.value.adress);
      // }

      // if (search.value.remoteDuel != null && search.value.remoteDuel!) {
      //   searchUser = searchUser.where('remoteDuel', isEqualTo: true);
      // }

      // if (search.value.sort == 'createdAtAsc') {
      //   searchUser = searchUser.endBefore([time]);
      // } else {
      //   searchUser = searchUser.startAfter([time]);
      // }
      Query<Recruit> searchRecruit = recruitsCollection()
          .orderBy('createdAt', descending: true)
          .orderBy('limit')
          .endBefore([time.toUtc().millisecondsSinceEpoch])
          .where('full', isEqualTo: false)
          .where('cancel', isEqualTo: false);

      recruitsQuery.value = searchRecruit;
    }

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        innerContext = dialogContext;
        return SimpleDialog(
          insetPadding: const EdgeInsets.all(20.0),
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FormBuilderDropdown(
                        name: 'playTitle',
                        initialValue: searchQuery.value.playTitle,
                        decoration: const InputDecoration(
                            label: Text('プレイしているタイトル'),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                        items: [
                          const DropdownMenuItem(
                            child: Text('タイトルを入力'),
                            value: null,
                          ),
                          ...playTitleOption
                              .map((t) => DropdownMenuItem(
                                    child: Text(t),
                                    value: t,
                                  ))
                              .toList()
                        ]),
                    FormBuilderDropdown(
                        name: 'adress',
                        initialValue: searchQuery.value.adress,
                        decoration: const InputDecoration(
                            label: Text('居住地'),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                        items: [
                          const DropdownMenuItem(
                            child: Text('都道府県を入力'),
                            value: null,
                          ),
                          ...adressOption
                              .map((t) => DropdownMenuItem(
                                    child: Text(t),
                                    value: t,
                                  ))
                              .toList()
                        ]),
                    FormBuilderSwitch(
                      title: Text('リモートデュエル環境'),
                      name: 'remoteDuel',
                      initialValue: searchQuery.value.remoteDuel,
                    ),
                    FormBuilderDropdown(
                        initialValue: searchQuery.value.sort,
                        name: 'sort',
                        decoration: const InputDecoration(
                            label: Text('並び替え'),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                        items: const [
                          DropdownMenuItem(
                            child: Text('アクティブ順'),
                            value: 'activeAt',
                          ),
                          DropdownMenuItem(
                            child: Text('登録が新しい順'),
                            value: 'createdAtDesc',
                          ),
                          DropdownMenuItem(
                            child: Text('登録が古い順'),
                            value: 'createdAtAsc',
                          ),
                        ]),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SearchButton(onPressed: () {
                      Navigator.of(innerContext).pop();
                      _formKey.currentState!.save();

                      searchQuery.value = searchQuery.value.copyWith(
                        playTitle: _formKey.currentState?.value['playTitle'],
                        adress: _formKey.currentState?.value['adress'],
                        remoteDuel: _formKey.currentState?.value['remoteDuel'],
                        sort: _formKey.currentState?.value['sort'],
                      );
                      getRecruitsQuery();
                    }),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

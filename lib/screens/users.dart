import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/model/users_search/users_search.dart';
import 'package:duel_matching/parts/friends_when_consumer.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/search_button.dart';
import 'package:duel_matching/parts/user_card.dart';
import 'package:duel_matching/parts/user_when_consumer.dart';
import 'package:duel_matching/viewmodel/users_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersScreen extends HookConsumerWidget {
  UsersScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNow = useMemoized(DateTime.now);
    final usersQueryProvider = ref.watch(usersProvider(timeNow).notifier);
    final searchQuery = useState<UsersSearch>(UsersSearch(
      sort: 'activeAt',
    ));

    return UserWhenConsumer(
      child: (user) => FriendsWhenConsumer(child: (friends) {
        final blockIds = useState<List<String>>([
          FirebaseAuth.instance.currentUser!.uid,
          ...friends.map((f) => f.uid).toList(),
          ...?user.blockList
        ]);

        return PrimaryScaffold(
          appBarAction: [
            IconButton(
                iconSize: 33,
                onPressed: () => searchDialog(
                    context, ref, searchQuery, usersQueryProvider, timeNow),
                icon: const Icon(Icons.manage_search_outlined))
          ],
          sliverChild: SliverList(
            delegate: SliverChildListDelegate(
              [
                FirestoreQueryBuilder(
                    query: usersQueryProvider.state,
                    builder: (context,
                        FirestoreQueryBuilderSnapshot<Profile> snapshot, _) {
                      List<QueryDocumentSnapshot<Profile>> docs = snapshot.docs
                          .where(
                              (element) => !blockIds.value.contains(element.id))
                          .toList();
                      if (snapshot.isFetching) {
                        return Center(
                            child: Column(
                          children: const [
                            SizedBox(
                              height: 100.0,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ));
                      }

                      if (snapshot.hasError) {
                        return Center(
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
                                  usersQueryProvider.update((state) =>
                                      getUsersQuery(searchQuery, timeNow));
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      if (docs.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 100.0,
                              ),
                              const Text('ユーザが見つかりませんでした'),
                              ElevatedButton(
                                style: ButtonStyle(
                                    textStyle: MaterialStateProperty.all(
                                        const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.redAccent)),
                                child: const Text('再検索する'),
                                onPressed: () {
                                  searchDialog(context, ref, searchQuery,
                                      usersQueryProvider, timeNow);
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 1,
                          ),
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            // if we reached the end of the currently obtained items, we try to
                            // obtain more items
                            if (snapshot.hasMore && index + 1 == docs.length) {
                              // Tell FirestoreQueryBuilder to try to obtain more items.
                              // It is safe to call this function from within the build method.
                              snapshot.fetchMore();
                            }

                            final user = docs[index].data();
                            final id = docs[index].id;

                            return GestureDetector(
                              onTap: () =>
                                  GoRouter.of(context).push('/user/$id'),
                              child: UserCard(
                                avatar: user.avatar,
                                adress: user.adress,
                                favorite: user.favorite,
                                comment: user.comment,
                                name: user.name,
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }

  searchDialog(context, WidgetRef ref, ValueNotifier<UsersSearch> searchQuery,
      StateController<Query<Profile>> usersQueryProvider, DateTime time) {
    BuildContext innerContext;
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
                        title: const Text('リモートデュエル環境'),
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
                          remoteDuel:
                              _formKey.currentState?.value['remoteDuel'],
                          sort: _formKey.currentState?.value['sort'],
                        );
                        usersQueryProvider.update(
                            (state) => getUsersQuery(searchQuery, time));
                      }),
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }

  Query<Profile> getUsersQuery(
      ValueNotifier<UsersSearch> search, DateTime time) {
    Query<Profile> searchUser;
    if (search.value.sort == 'activeAt') {
      searchUser = userCollection().orderBy('activeAt', descending: true);
    } else if (search.value.sort == 'createdAtDesc') {
      searchUser = userCollection().orderBy('createdAt', descending: true);
    } else if (search.value.sort == 'createdAtAsc') {
      searchUser = userCollection().orderBy('createdAt');
    } else {
      searchUser = userCollection().orderBy('activeAt', descending: true);
    }

    if (search.value.playTitle.isNotNullAndNotEmpty) {
      searchUser =
          searchUser.where('playTitle', arrayContains: search.value.playTitle);
    }

    if (search.value.adress.isNotNullAndNotEmpty) {
      searchUser = searchUser.where('adress', isEqualTo: search.value.adress);
    }

    if (search.value.remoteDuel != null && search.value.remoteDuel!) {
      searchUser = searchUser.where('remoteDuel', isEqualTo: true);
    }

    if (search.value.sort == 'createdAtAsc') {
      searchUser = searchUser.endBefore([time]);
    } else {
      searchUser = searchUser.startAfter([time]);
    }

    return searchUser;
  }
}

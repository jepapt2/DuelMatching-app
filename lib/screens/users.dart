import 'package:duel_matching/freezed/users_view.dart/users_view.dart';
import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:duel_matching/parts/scroll_detector.dart';
import 'package:duel_matching/parts/search_button.dart';
import 'package:duel_matching/parts/user_card.dart';
import 'package:duel_matching/viewmodel/users_future_scroll.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersScreen extends HookConsumerWidget {
  UsersScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersController = ref.watch(usersFutureScrollProvider);
    final usersControllerNotifier =
        ref.watch(usersFutureScrollProvider.notifier);

    return UserWhenConsumer(
      child: (user) => FriendsWhenConsumer(child: (friends) {
        final hideIds = [
          FirebaseAuth.instance.currentUser!.uid,
          ...friends.map((f) => f.uid).toList(),
          ...?user.blockList
        ];

        useEffect(() {
          Future.delayed(
            Duration.zero,
            () => usersControllerNotifier.loadUsers(hideIds),
          );
        }, []);

        return PrimaryScaffold(
          pageIndex: 0,
          user: user,
          child: ScrollDetector(
            threshold: 0.8,
            loadNext: () => usersControllerNotifier.loadUsers(hideIds),
            builder: (context, controller) => RefreshIndicator(
              onRefresh: () => usersControllerNotifier.refreshUsers(hideIds),
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  PrimarySliverAppBar(
                    user: user,
                    appBarAction: [
                      IconButton(
                          iconSize: 33,
                          onPressed: () => searchDialog(
                              context,
                              ref,
                              usersController,
                              usersControllerNotifier,
                              hideIds),
                          icon: const Icon(Icons.manage_search_outlined))
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if (usersController.list == null &&
                            usersController.loading)
                          Center(
                              child: Column(
                            children: const [
                              SizedBox(
                                height: 100.0,
                              ),
                              CircularProgressIndicator(),
                            ],
                          ))
                        else if (usersController.error)
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 100.0,
                                ),
                                const Text('???????????????????????????????????????'),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.redAccent)),
                                  child: const Text('????????????'),
                                  onPressed: () {
                                    usersControllerNotifier
                                        .refreshUsers(hideIds);
                                  },
                                ),
                              ],
                            ),
                          )
                        else if (usersController.list == null)
                          const SizedBox()
                        else if (usersController.list!.isEmpty)
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 100.0,
                                ),
                                const Text('??????????????????????????????????????????'),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.redAccent)),
                                  child: const Text('???????????????'),
                                  onPressed: () {
                                    searchDialog(context, ref, usersController,
                                        usersControllerNotifier, hideIds);
                                  },
                                ),
                              ],
                            ),
                          )
                        else
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 5,
                                childAspectRatio: 1,
                              ),
                              itemCount: usersController.list?.length != null
                                  ? usersController.list!.length
                                  : 0,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () => GoRouter.of(context).push(
                                      '/user/${usersController.list![index].id}'),
                                  child: UserCard(
                                    name: usersController
                                        .list![index].profile.name,
                                    avatar: usersController
                                        .list![index].profile.avatar,
                                    adress: usersController
                                        .list![index].profile.adress,
                                    favorite: usersController
                                        .list![index].profile.favorite,
                                    comment: usersController
                                        .list![index].profile.comment,
                                  ),
                                );
                              }),
                        const SizedBox(
                          height: 100.0,
                        ),
                        if (usersController.list != null &&
                            usersController.list!.isNotEmpty &&
                            usersController.loading)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  searchDialog(context, WidgetRef ref, UsersFutureScroll usersController,
      UsersFutureScrollNotifier usersControllerNotifier, List<String> hideIds) {
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
                          initialValue: usersController.searchItem.playTitle,
                          decoration: const InputDecoration(
                              label: Text('?????????????????????????????????'),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          items: [
                            const DropdownMenuItem(
                              child: Text('?????????????????????'),
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
                          initialValue: usersController.searchItem.adress,
                          decoration: const InputDecoration(
                              label: Text('?????????'),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          items: [
                            const DropdownMenuItem(
                              child: Text('?????????????????????'),
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
                        title: const Text('??????????????????????????????'),
                        name: 'remoteDuel',
                        initialValue: usersController.searchItem.remoteDuel,
                      ),
                      FormBuilderDropdown(
                          initialValue: usersController.searchItem.sort,
                          name: 'sort',
                          decoration: const InputDecoration(
                              label: Text('????????????'),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          items: const [
                            DropdownMenuItem(
                              child: Text('??????????????????'),
                              value: 'activeAt',
                            ),
                            DropdownMenuItem(
                              child: Text('?????????????????????'),
                              value: 'createdAtDesc',
                            ),
                            DropdownMenuItem(
                              child: Text('??????????????????'),
                              value: 'createdAtAsc',
                            ),
                          ]),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SearchButton(onPressed: () {
                        Navigator.of(innerContext).pop();
                        _formKey.currentState!.save();

                        usersControllerNotifier.searchUsers(
                          UsersSearch(
                            playTitle:
                                _formKey.currentState?.value['playTitle'],
                            adress: _formKey.currentState?.value['adress'],
                            remoteDuel:
                                _formKey.currentState?.value['remoteDuel'],
                            sort: _formKey.currentState?.value['sort'],
                          ),
                          hideIds,
                        );
                      }),
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/recruits_view/recruits_view.dart';
import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:duel_matching/parts/recruit_card.dart';
import 'package:duel_matching/parts/scroll_detector.dart';
import 'package:duel_matching/parts/search_button.dart';
import 'package:duel_matching/viewmodel/recruits_future_scroll.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RecruitsScreen extends HookConsumerWidget {
  RecruitsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruitsController = ref.watch(recruitsFutureScrollProvider);
    final recruitsControllerNotifier =
        ref.watch(recruitsFutureScrollProvider.notifier);
    final DateTime nowTime = DateTime.now();

    return UserWhenConsumer(
      child: (user) => FriendsWhenConsumer(child: (friends) {
        final blockList = [...?user.blockList];
        useEffect(() {
          Future.delayed(
            Duration.zero,
            () => recruitsControllerNotifier.loadRecruits(nowTime, blockList),
          );
        }, []);

        return PrimaryScaffold(
          pageIndex: 1,
          user: user,
          child: ScrollDetector(
            threshold: 0.8,
            loadNext: () =>
                recruitsControllerNotifier.loadRecruits(nowTime, blockList),
            builder: (context, controller) => RefreshIndicator(
              onRefresh: () => recruitsControllerNotifier.recruitsRefresh(
                  nowTime, blockList),
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  PrimarySliverAppBar(
                    user: user,
                    appBarText: '対戦募集',
                    appBarAction: [
                      IconButton(
                          iconSize: 33,
                          onPressed: () => searchDialog(
                              context,
                              ref,
                              recruitsController,
                              recruitsControllerNotifier,
                              nowTime,
                              blockList),
                          icon: const Icon(Icons.manage_search_outlined))
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if (recruitsController.list == null &&
                            recruitsController.loading)
                          Center(
                              child: Column(
                            children: const [
                              SizedBox(
                                height: 100.0,
                              ),
                              CircularProgressIndicator(),
                            ],
                          ))
                        else if (recruitsController.error)
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 100.0,
                                ),
                                const Text('募集の取得に失敗しました'),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.redAccent)),
                                  child: const Text('更新する'),
                                  onPressed: () {
                                    recruitsControllerNotifier.recruitsRefresh(
                                        nowTime, blockList);
                                  },
                                ),
                              ],
                            ),
                          )
                        else if (recruitsController.list == null)
                          const SizedBox()
                        else if (recruitsController.list!.isEmpty)
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 100.0,
                                ),
                                const Text('募集が見つかりませんでした'),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.redAccent)),
                                  child: const Text('再検索する'),
                                  onPressed: () {
                                    searchDialog(
                                        context,
                                        ref,
                                        recruitsController,
                                        recruitsControllerNotifier,
                                        nowTime,
                                        blockList);
                                  },
                                ),
                              ],
                            ),
                          )
                        else
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recruitsController.list?.length != null
                                  ? recruitsController.list!.length
                                  : 0 + (recruitsController.loading ? 1 : 0),
                              itemBuilder: (context, int index) {
                                Recruit recruit =
                                    recruitsController.list![index].recruit;
                                if (recruitsController.list!.length >= index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => GoRouter.of(context).push(
                                            '/recruit/${recruitsController.list![index].id}'),
                                        child: RecruitCard(
                                          title: recruit.title,
                                          playTitle: recruit.playTitle,
                                          format: recruit.format,
                                          place: recruit.place,
                                          point: recruit.point,
                                          start: recruit.start!,
                                          end: recruit.end,
                                          reqruitNumber: recruit.recruitNumber,
                                          memberCount: recruit.memberCount,
                                        ),
                                      ),
                                      const Divider()
                                    ],
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Color(0xffeff0f3),
            ),
            onPressed: () => GoRouter.of(context).push('/recruit_new'),
          ),
        );
      }),
    );
  }

  searchDialog(
      context,
      WidgetRef ref,
      RecruitsFutureScroll recruitsController,
      RecruitsFutureScrollNotifier recruitsControllerNotifier,
      DateTime nowTime,
      List<String> blockList) {
    BuildContext innerContext;
    bool startInputEnabled =
        recruitsController.searchItem.sort == 'startDesc' ||
            recruitsController.searchItem.sort == 'startAsc';
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        innerContext = dialogContext;
        return SimpleDialog(
          insetPadding: const EdgeInsets.all(20.0),
          children: <Widget>[
            StatefulBuilder(builder: (context, setState) {
              return FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        FormBuilderDropdown(
                            name: 'playTitle',
                            initialValue:
                                recruitsController.searchItem.playTitle,
                            decoration: const InputDecoration(
                                label: Text('プレイしているタイトル'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            items: [
                              const DropdownMenuItem(
                                child: Text('タイトルを入力'),
                                value: null,
                              ),
                              const DropdownMenuItem(
                                child: Text('その他'),
                                value: 'その他',
                              ),
                              ...playTitleOption
                                  .map((t) => DropdownMenuItem(
                                        child: Text(t),
                                        value: t,
                                      ))
                                  .toList()
                            ]),
                        FormBuilderDropdown(
                            name: 'place',
                            // initialValue: recruitsController.searchItem.place,
                            decoration: const InputDecoration(
                                label: Text('開催する場所'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            items: [
                              const DropdownMenuItem(
                                child: Text('場所を入力'),
                                value: null,
                              ),
                              const DropdownMenuItem(
                                child: Text('オンライン'),
                                value: 'オンライン',
                              ),
                              ...adressOption
                                  .map((t) => DropdownMenuItem(
                                        child: Text(t),
                                        value: t,
                                      ))
                                  .toList()
                            ]),
                        FormBuilderDropdown(
                            name: 'friendOnly',
                            initialValue:
                                recruitsController.searchItem.friendOnly,
                            decoration: const InputDecoration(
                                label: Text('募集範囲'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            items: const [
                              DropdownMenuItem(
                                child: Text('誰でも'),
                                value: false,
                              ),
                              DropdownMenuItem(
                                child: Text('フレンドのみ'),
                                value: true,
                              ),
                              DropdownMenuItem(
                                child: Text('すべて'),
                                value: null,
                              ),
                            ]),
                        FormBuilderDropdown(
                            initialValue: recruitsController.searchItem.sort,
                            name: 'sort',
                            decoration: const InputDecoration(
                                label: Text('並び替え'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            onChanged: (value) {
                              setState(() {
                                startInputEnabled =
                                    value == 'startDesc' || value == 'startAsc';
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                child: Text('開始時間が近い順'),
                                value: 'startDesc',
                              ),
                              DropdownMenuItem(
                                child: Text('開始時間が遠い順'),
                                value: 'startAsc',
                              ),
                              DropdownMenuItem(
                                child: Text('募集期限が近い順'),
                                value: 'limitDesc',
                              ),
                              DropdownMenuItem(
                                child: Text('募集期限が遠い順'),
                                value: 'limitAsc',
                              ),
                              DropdownMenuItem(
                                child: Text('投稿が新しい順'),
                                value: 'createdAtDesc',
                              ),
                              DropdownMenuItem(
                                child: Text('投稿が古い順'),
                                value: 'createdAtAsc',
                              ),
                            ]),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderDateTimePicker(
                          initialValue: recruitsController.searchItem.start !=
                                  null
                              ? recruitsController.searchItem.start!.toDate()
                              : null,
                          locale: const Locale('ja'),
                          inputType: InputType.date,
                          format: DateFormat('yyyy/M/d'),
                          name: 'start',
                          enabled: startInputEnabled,
                          decoration: InputDecoration(
                            label: const Text('開催日(開始時間でソート時のみ)'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isDense: true,
                            suffix: InkWell(
                              onTap: () {
                                _formKey.currentState!.fields['start']
                                    ?.didChange(null);
                              },
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SearchButton(onPressed: () {
                          Navigator.of(innerContext).pop();
                          _formKey.currentState!.save();

                          Timestamp? startTimestamp =
                              _formKey.currentState?.value['start'] != null
                                  ? Timestamp.fromDate(
                                      _formKey.currentState?.value['start'])
                                  : null;

                          recruitsControllerNotifier.searchRecruits(
                              RecruitsSearch(
                                  playTitle:
                                      _formKey.currentState?.value['playTitle'],
                                  place: _formKey.currentState?.value['place'],
                                  friendOnly: _formKey
                                      .currentState?.value['friendOnly'],
                                  sort: _formKey.currentState?.value['sort'],
                                  start: startTimestamp),
                              nowTime,
                              blockList);
                        }),
                      ],
                    ),
                  ));
            })
          ],
        );
      },
    );
  }
}

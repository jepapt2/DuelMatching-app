import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/joinMember.dart';
import 'package:duel_matching/viewmodel/recruit_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../input_options/dynamicLinks.dart';

class RecruitScreen extends HookConsumerWidget {
  const RecruitScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserWhenConsumer(
        child: (myProfile) => RecruitWhenConsumer(
              id: id,
              child: (recruit) => MembersWhenConsumer(
                id: id,
                child: (members) => UserDisposeWhenConsumer(
                  //主催者の情報を取得
                  id: recruit.organizerId,
                  child: (organizer) => FriendsWhenConsumer(
                    //主催者のフレンドを取得
                    id: recruit.organizerId,
                    //主催者のブロックリストに存在するか判定
                    child: (organizerFriends) => organizer.blockList == null ||
                            organizer.blockList!.isEmpty ||
                            !organizer.blockList!
                                .contains(firebaseCurrentUserId)
                        ? Scaffold(
                            backgroundColor: const Color(0xffeff0f3),
                            appBar: AppBar(
                              title: Text(recruit.title),
                              actions: [
                                IconButton(
                                    onPressed: () async {
                                      Uri uri = await recruitShareDynamicLinks(
                                          id: id, recruit: recruit);
                                      Share.share(
                                          '${recruit.title} | DuelMatchingで対戦募集に参加しよう ${uri.toString()} #DuelMatching');
                                    },
                                    icon: const Icon(Icons.share)),
                                PopupMenuButton(
                                    itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            child: const Text('このグループを抜ける'),
                                            onTap: () =>
                                                memberExitDialog(context),
                                            //自分が主催者ではない、かつ自分がメンバーに存在する
                                            enabled: firebaseCurrentUserId !=
                                                    recruit.organizerId &&
                                                members
                                                    .map((m) => m.uid)
                                                    .toList()
                                                    .contains(
                                                        firebaseCurrentUserId),
                                          ),
                                          PopupMenuItem(
                                              child: const Text('対戦募集をキャンセルする'),
                                              onTap: () =>
                                                  recruitCancelDialog(context),
                                              //主催者のみtrue
                                              enabled: firebaseCurrentUserId ==
                                                  recruit.organizerId),
                                        ]),
                              ],
                            ),
                            body: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Visibility(
                                      visible: recruit.cancel,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 30.0,
                                        ),
                                        child: Container(
                                          color: const Color(0xfffffffe),
                                          padding: const EdgeInsets.all(8.0),
                                          child: const Center(
                                            child: Text(
                                              'この募集はキャンセルされました',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    color: const Color(0xfffffffe),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Table(
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: IntrinsicColumnWidth(),
                                            1: FlexColumnWidth(10.0),
                                          },
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            TableRow(children: [
                                              const Text('プレイタイトル'),
                                              Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 20.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Chip(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        label: Text(
                                                            recruit.playTitle)),
                                                  )),
                                            ]),
                                            if (recruit
                                                .format.isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('対戦形式'),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 20.0),
                                                  child: Text(recruit.format!),
                                                )
                                              ]),
                                            TableRow(children: [
                                              const Text('開催場所'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.place),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('詳細な場所'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.point),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('募集範囲'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.friendOnly
                                                    ? 'フレンドのみ'
                                                    : '誰でも'),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('募集人数'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(
                                                    '${recruit.recruitNumber.toString()}人'),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('開始時間'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(DateFormat(
                                                        'yyyy/M/d hh:mm')
                                                    .format(recruit.start!)),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('終了時間'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.end != null
                                                    ? DateFormat(
                                                            'yyyy/M/d HH:mm')
                                                        .format(recruit.end!)
                                                    : '未定'),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('募集期限'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(DateFormat(
                                                        'yyyy/M/d HH:mm')
                                                    .format(recruit.limit!)),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        recruit.overview.isNotNullAndNotEmpty,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          color: const Color(0xfffffffe),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('概要'),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                Text(recruit.overview!)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: const Color(0xfffffffe),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('主催者'),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          GestureDetector(
                                            onTap: () => GoRouter.of(context)
                                                .push(
                                                    '/user/${members.first.uid}'),
                                            child: Row(
                                              children: [
                                                AvatarImage(
                                                  avatar: members.first.avatar,
                                                  radius: 25,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(members.first.name)
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                              visible: 1 < members.length,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  const Text('メンバー'),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Wrap(
                                                      spacing: 5.0,
                                                      runSpacing: 5.0,
                                                      children: members
                                                          .sublist(1)
                                                          .map((m) => Tooltip(
                                                                message: m.name,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      GoRouter.of(
                                                                              context)
                                                                          .push(
                                                                              '/user/${m.uid}'),
                                                                  child: AvatarImage(
                                                                      radius:
                                                                          25,
                                                                      avatar: m
                                                                          .avatar),
                                                                ),
                                                              ))
                                                          .toList())
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: joinButton(
                                            myProfile,
                                            recruit,
                                            members,
                                            organizerFriends,
                                            context)),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  )
                                ],
                              ),
                            ),
                          )
                        : Scaffold(
                            appBar: AppBar(
                              title: Text(recruit.title),
                            ),
                            body: Container(
                              color: const Color(0xffeff0f3),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      '主催者にブロックされています',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('対戦募集には参加できません'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ));
  }

  memberExitDialog(BuildContext context) {
    memberExit(dialogContext) async {
      Navigator.pop(dialogContext);
      try {
        await membersCollection(id).doc(firebaseCurrentUserId).delete();
        Fluttertoast.showToast(
            msg: 'グループから退出しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: '退出処理に失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('グループから抜ける'),
                content: const Text("このグループから退出しますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => memberExit(dialogContext),
                  ),
                ],
              );
            }));
  }

  recruitCancelDialog(BuildContext context) {
    recruitCancel(dialogContext) async {
      Navigator.pop(dialogContext);
      try {
        await recruitDocument(id).update({'cancel': true});
        Fluttertoast.showToast(
            msg: '募集をキャンセルしました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: 'キャンセル処理に失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('募集のキャンセル'),
                content:
                    const Text("キャンセルした募集は再開することができません。\nこの対戦募集をキャンセルしますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => recruitCancel(dialogContext),
                  ),
                ],
              );
            }));
  }

  Widget joinButton(Profile myProfile, Recruit recruit, List<Member> members,
      List<FriendWithId> organizerFriends, BuildContext context) {
    joinDialog() {
      return Future.delayed(
          const Duration(seconds: 0),
          () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('参加'),
                  content: const Text("この対戦募集に参加しますか？"),
                  actions: [
                    TextButton(
                      child: const Text("いいえ"),
                      onPressed: () => Navigator.pop(dialogContext),
                    ),
                    TextButton(
                      child: const Text("はい"),
                      onPressed: () => joinMember(
                          context: context,
                          dialogContext: dialogContext,
                          recruitId: id,
                          recruit: recruit,
                          members: members,
                          organizerFriends: organizerFriends,
                          myProfile: myProfile),
                    ),
                  ],
                );
              }));
    }

    if (members.map((m) => m.uid).toList().contains(firebaseCurrentUserId)) {
      return ElevatedButton(
        onPressed: () => GoRouter.of(context).push('/group/$id'),
        child: const Text('参加済み'),
      );
    }

    if (recruit.cancel) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('この募集はキャンセルされました'),
      );
    }
    if (recruit.recruitNumber <= members.length - 1) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('メンバーが満員です'),
      );
    }
    if (recruit.limit!.isBefore(DateTime.now())) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('募集期限を過ぎました'),
      );
    }
    if (recruit.friendOnly &&
        !organizerFriends
            .map((f) => f.uid)
            .toList()
            .contains(firebaseCurrentUserId)) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('主催者とフレンドではありません'),
      );
    }

    return ElevatedButton(
        onPressed: () => joinDialog(), child: const Text('参加する'));
  }
}

import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/recruit_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:intl/intl.dart';

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
                  id: recruit.organizerId,
                  child: (organizer) => FriendsWhenConsumer(
                    id: recruit.organizerId,
                    child: (organizerFriends) => organizer.blockList == null ||
                            organizer.blockList!.isEmpty ||
                            !organizer.blockList!.contains(
                                FirebaseAuth.instance.currentUser!.uid)
                        ? Scaffold(
                            backgroundColor: const Color(0xffeff0f3),
                            appBar: AppBar(
                              title: Text(recruit.title),
                              actions: [
                                PopupMenuButton(
                                    itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            child: const Text('??????????????????????????????'),
                                            onTap: () =>
                                                memberExitDialog(context),
                                            enabled: FirebaseAuth.instance
                                                        .currentUser!.uid !=
                                                    recruit.organizerId &&
                                                members
                                                    .map((m) => m.uid)
                                                    .toList()
                                                    .contains(FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid),
                                          ),
                                          PopupMenuItem(
                                              child: const Text('????????????????????????????????????'),
                                              onTap: () =>
                                                  recruitCancelDialog(context),
                                              enabled: FirebaseAuth.instance
                                                      .currentUser!.uid ==
                                                  recruit.organizerId),
                                        ])
                              ],
                            ),
                            body: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    color: const Color(0xfffffffe),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 5.0),
                                    child: Center(
                                      child: Text(
                                        recruit.title,
                                        style: const TextStyle(
                                          color: Color(0xff2a2a2a),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          backgroundColor: Color(0xfffffffe),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
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
                                              '?????????????????????????????????????????????',
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
                                              const Text('?????????????????????'),
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
                                                const Text('????????????'),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 20.0),
                                                  child: Text(recruit.format!),
                                                )
                                              ]),
                                            TableRow(children: [
                                              const Text('????????????'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.place),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('???????????????'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.point),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('????????????'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.friendOnly
                                                    ? '??????????????????'
                                                    : '?????????'),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('????????????'),
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
                                              const Text('????????????'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 20.0),
                                                child: Text(recruit.end != null
                                                    ? DateFormat(
                                                            'yyyy/M/d HH:mm')
                                                        .format(recruit.end!)
                                                    : '??????'),
                                              )
                                            ]),
                                            TableRow(children: [
                                              const Text('????????????'),
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
                                                const Text('??????'),
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
                                          const Text('?????????'),
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
                                                    avatar:
                                                        members.first.avatar),
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
                                                  const Text('????????????'),
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
                                      '???????????????????????????????????????',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('???????????????????????????????????????'),
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
    memberExit() async {
      Navigator.pop(context);
      try {
        await membersCollection(id)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .delete();
        Fluttertoast.showToast(
            msg: '????????????????????????????????????',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: '?????????????????????????????????',
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
            builder: (_) {
              return AlertDialog(
                title: const Text('???????????????????????????'),
                content: const Text("?????????????????????????????????????????????"),
                actions: [
                  TextButton(
                    child: const Text("?????????"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("??????"),
                    onPressed: () => memberExit(),
                  ),
                ],
              );
            }));
  }

  recruitCancelDialog(BuildContext context) {
    recruitCancel() async {
      Navigator.pop(context);
      try {
        await recruitDocument(id).update({'cancel': true});
        Fluttertoast.showToast(
            msg: '????????????????????????????????????',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: '??????????????????????????????????????????',
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
            builder: (_) {
              return AlertDialog(
                title: const Text('????????????????????????'),
                content:
                    const Text("?????????????????????????????????????????????????????????????????????\n???????????????????????????????????????????????????"),
                actions: [
                  TextButton(
                    child: const Text("?????????"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("??????"),
                    onPressed: () => recruitCancel(),
                  ),
                ],
              );
            }));
  }

  Widget joinButton(Profile myProfile, Recruit recruit, List<Member> members,
      List<FriendWithId> organizerFriends, BuildContext context) {
    joinDialog() {
      joinMember() async {
        Navigator.pop(context);
        try {
          if (recruit.cancel ||
              (recruit.recruitNumber <= members.length - 1) ||
              recruit.limit!.isBefore(DateTime.now()) ||
              (recruit.friendOnly &&
                  !organizerFriends
                      .map((f) => f.uid)
                      .toList()
                      .contains(FirebaseAuth.instance.currentUser!.uid)) ||
              (members
                  .map((m) => m.uid)
                  .toList()
                  .contains(FirebaseAuth.instance.currentUser!.uid))) {
            throw Exception();
          }
          await membersCollection(id)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(Member(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  name: myProfile.name,
                  avatar: myProfile.avatar ?? '',
                  organizer: false,
                  noticeToken: myProfile.noticeToken ?? [],
                  noticeTitle: '${recruit.title} (${members.length + 1})',
                  createdAt: DateTime.now()));
          GoRouter.of(context).push('/group/$id');
          Fluttertoast.showToast(
              msg: '???????????????????????????',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 13.0);
        } catch (_) {
          Fluttertoast.showToast(
              msg: '???????????????????????????',
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
              builder: (_) {
                return AlertDialog(
                  title: const Text('??????'),
                  content: const Text("??????????????????????????????????????????"),
                  actions: [
                    TextButton(
                      child: const Text("?????????"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("??????"),
                      onPressed: () => joinMember(),
                    ),
                  ],
                );
              }));
    }

    if (members
        .map((m) => m.uid)
        .toList()
        .contains(FirebaseAuth.instance.currentUser!.uid)) {
      return ElevatedButton(
        onPressed: () => GoRouter.of(context).push('/group/$id'),
        child: const Text('????????????'),
      );
    }

    if (recruit.cancel) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('?????????????????????????????????????????????'),
      );
    }
    if (recruit.recruitNumber <= members.length - 1) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('???????????????????????????'),
      );
    }
    if (recruit.limit!.isBefore(DateTime.now())) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('??????????????????????????????'),
      );
    }
    if (recruit.friendOnly &&
        !organizerFriends
            .map((f) => f.uid)
            .toList()
            .contains(FirebaseAuth.instance.currentUser!.uid)) {
      return const ElevatedButton(
        onPressed: null,
        child: Text('?????????????????????????????????????????????'),
      );
    }

    return ElevatedButton(
        onPressed: () => joinDialog(), child: const Text('????????????'));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/report/report.dart';
import 'package:duel_matching/model/request/request.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

class RecruitScreen extends HookConsumerWidget {
  const RecruitScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(disposeProfileProvider(id));

    return UserWhenConsumer(
      child: (myProfile) => userProfile.when(
        data: (user) {
          bool isBlocked = user.blockList == null ||
              !user.blockList!.contains(FirebaseAuth.instance.currentUser!.uid);
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  stretchTriggerOffset: 50.0,
                  automaticallyImplyLeading: false,
                  shape: Border.all(width: 0, style: BorderStyle.none),
                  centerTitle: true,
                  pinned: true,
                  expandedHeight: 285.0,
                  leading: Center(
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).pop(),
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_back,
                              size: 26,
                            )
                          ]),
                    ),
                  ),
                  actions: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Column(
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                  color: Color(0xff2a2a2a),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    background: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          const SizedBox(
                            height: 200,
                          ),
                          user.header.isNotNullAndNotEmpty
                              ? Image.network(
                                  user.header!,
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.black54,
                                  width: double.infinity,
                                  height: 200.0,
                                ),
                          Positioned(
                            top: 150,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: avatarImage(user.avatar),
                            ),
                          ),
                        ]),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      isBlocked
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (user.comment.isNotNullAndNotEmpty)
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Text(user.comment!),
                                  ),
                                Visibility(
                                  visible: user
                                          .activityDay.isNotNullAndNotEmpty ||
                                      user.activityTime.isNotNullAndNotEmpty ||
                                      user.adress.isNotNullAndNotEmpty ||
                                      user.age.isNotNullAndNotEmpty ||
                                      user.favorite.isNotNullAndNotEmpty ||
                                      user.playTitle != null &&
                                          user.playTitle!.isNotEmpty ||
                                      user.remoteDuel != null ||
                                      user.sex.isNotNullAndNotEmpty,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 10.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Table(
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: IntrinsicColumnWidth(),
                                            1: FlexColumnWidth(10.0),
                                          },
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            if (user.playTitle != null &&
                                                user.playTitle!.isNotEmpty)
                                              TableRow(children: [
                                                const Text('プレイタイトル'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Wrap(
                                                      spacing: 2.0,
                                                      runSpacing: 5.0,
                                                      children: user.playTitle!
                                                          .map((t) => Chip(
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              label: Text(t)))
                                                          .toList()),
                                                )
                                              ]),
                                            if (user
                                                .favorite.isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('好きなカード'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(user.favorite!),
                                                )
                                              ]),
                                            if (user
                                                .adress.isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('居住地'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(user.adress!),
                                                )
                                              ]),
                                            if (user.remoteDuel != null)
                                              TableRow(children: [
                                                const Text('リモート対戦環境'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(user.remoteDuel!
                                                      ? 'あり'
                                                      : 'なし'),
                                                )
                                              ]),
                                            if (user.activityDay
                                                .isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('活動日'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child:
                                                      Text(user.activityDay!),
                                                )
                                              ]),
                                            if (user.activityTime
                                                .isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('活動時間'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child:
                                                      Text(user.activityTime!),
                                                )
                                              ]),
                                            if (user.age.isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('年齢'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(user.age!),
                                                )
                                              ]),
                                            if (user.sex.isNotNullAndNotEmpty)
                                              TableRow(children: [
                                                const Text('性別'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(user.sex!),
                                                )
                                              ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (user.introduction.isNotNullAndNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 10.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('自己紹介'),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              Text(user.introduction!)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 80.0,
                                )
                              ],
                            )
                          : Container(
                              color: const Color(0xffeff0f3),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      'ブロックされています',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('このユーザのプロフィールを見ることはできません'),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: isBlocked
                ? FloatingActionButton(
                    child: const FaIcon(
                      FontAwesomeIcons.userPlus,
                      color: Color(0xfffffffe),
                    ),
                    onPressed: () => friendRequestDialog(
                        myProfile.name, myProfile.avatar, user.name, context))
                : null,
          );
        },
        error: (error, stack) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('アカウント情報の取得に失敗しました'),
                ElevatedButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  child: const Text('更新する'),
                  onPressed: () {
                    ref.refresh(disposeProfileProvider(id));
                  },
                ),
              ],
            ),
          ),
        ),
        loading: () => Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  ImageProvider<Object> avatarImage(String? avatar) {
    if (avatar.isNotNullAndNotEmpty) {
      return NetworkImage(avatar!);
    } else {
      return const AssetImage('assets/images/initial_avatar.png');
    }
  }

  friendRequestDialog(
      String sendName, String? sendAvatar, String name, BuildContext context) {
    friendRequest() async {
      Navigator.pop(context);
      try {
        await requestDocument('${FirebaseAuth.instance.currentUser!.uid}_$id')
            .set(Request(
                sendId: FirebaseAuth.instance.currentUser!.uid,
                sendName: sendName,
                sendAvatar: sendAvatar.isNotNullAndNotEmpty ? sendAvatar : '',
                recId: id,
                permission: false,
                rejection: false,
                updateAt: DateTime.now()));
        Fluttertoast.showToast(
            msg: '$nameにフレンド申請しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: 'フレンド申請に失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: const Text('フレンド申請'),
            content: Text("$nameにフレンド申請しますか？"),
            actions: [
              TextButton(
                child: const Text("いいえ"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("はい"),
                onPressed: () => friendRequest(),
              ),
            ],
          );
        });
  }

  friendDocumentDelete(bool isFriend) async {
    if (isFriend) {
      await userDocument(FirebaseAuth.instance.currentUser!.uid)
          .collection('friends')
          .doc(id)
          .delete();
    }
  }

  friendDeleteDialog(BuildContext context, String name, bool isFriend) {
    friendDelete() async {
      Navigator.pop(context);
      try {
        await friendDocumentDelete(isFriend);
        Fluttertoast.showToast(
            msg: '$nameをフレンドから削除しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: 'フレンド削除に失敗しました',
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
                title: const Text('フレンド削除'),
                content: Text("$nameをフレンドから削除しますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => friendDelete(),
                  ),
                ],
              );
            }));
  }

  userBlockDialog(BuildContext context, String name, bool isFriend) {
    friendDelete() async {
      Navigator.pop(context);
      try {
        await friendDocumentDelete(isFriend);
        await userDocument(FirebaseAuth.instance.currentUser!.uid).update({
          'blockList': FieldValue.arrayUnion([id])
        });
        Fluttertoast.showToast(
            msg: '$nameをブロックしました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 13.0);
      } catch (_) {
        Fluttertoast.showToast(
            msg: 'ブロックに失敗しました',
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
                title: Text('$nameをブロック'),
                content: const Text(
                    "ユーザをブロックするとフレンドから削除され、ユーザ一覧から表示されなくなります。\nまた、対象のユーザは貴方のプロフィールを確認できません。"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => friendDelete(),
                  ),
                ],
              );
            }));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/reports/reports.dart';
import 'package:duel_matching/model/request/request.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/parts/friends_when_consumer.dart';
import 'package:duel_matching/parts/user_when_consumer.dart';
import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
      child: (myProfile) => FriendsWhenConsumer(
        child: (friends) => userProfile.when(
          data: (user) {
            bool isBlocked = user.blockList == null ||
                !user.blockList!
                    .contains(FirebaseAuth.instance.currentUser!.uid);
            bool isFriend = friends.map((f) => f.uid).toList().contains(id);
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
                                PopupMenuButton(
                                    itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            child: const Text('フレンドから削除'),
                                            onTap: () => friendDeleteDialog(
                                                context, user.name, isFriend),
                                            enabled: isFriend,
                                          ),
                                          PopupMenuItem(
                                            child: const Text('このユーザをブロック'),
                                            onTap: () => userBlockDialog(
                                                context, user.name, isFriend),
                                            enabled: isBlocked,
                                          ),
                                          PopupMenuItem(
                                            child: const Text('このユーザを報告'),
                                            onTap: () => userReportDialog(
                                                context,
                                                user.name,
                                                myProfile.name,
                                                isFriend),
                                          )
                                        ]),
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
                                        user.activityTime
                                            .isNotNullAndNotEmpty ||
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
                                                TableCellVerticalAlignment
                                                    .middle,
                                            children: [
                                              if (user.playTitle != null &&
                                                  user.playTitle!.isNotEmpty)
                                                TableRow(children: [
                                                  const Text('プレイタイトル'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Wrap(
                                                        spacing: 2.0,
                                                        runSpacing: 5.0,
                                                        children: user
                                                            .playTitle!
                                                            .map((t) => Chip(
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                label: Text(t)))
                                                            .toList()),
                                                  )
                                                ]),
                                              if (user.favorite
                                                  .isNotNullAndNotEmpty)
                                                TableRow(children: [
                                                  const Text('好きなカード'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(user.favorite!),
                                                  )
                                                ]),
                                              if (user
                                                  .adress.isNotNullAndNotEmpty)
                                                TableRow(children: [
                                                  const Text('居住地'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(user.adress!),
                                                  )
                                                ]),
                                              if (user.remoteDuel != null)
                                                TableRow(children: [
                                                  const Text('リモート対戦環境'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        user.activityTime!),
                                                  )
                                                ]),
                                              if (user.age.isNotNullAndNotEmpty)
                                                TableRow(children: [
                                                  const Text('年齢'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(user.age!),
                                                  )
                                                ]),
                                              if (user.sex.isNotNullAndNotEmpty)
                                                TableRow(children: [
                                                  const Text('性別'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
              floatingActionButton: isBlocked && !isFriend
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

  userReportDialog(
      BuildContext context, String reportName, String sendName, bool isFriend) {
    final _formKey = GlobalKey<FormBuilderState>();
    userReport() async {
      if (_formKey.currentState!.validate()) {
        try {
          _formKey.currentState!.save();
          await friendDocumentDelete(isFriend);
          await reportsCollection().add(Reports(
              sendId: FirebaseAuth.instance.currentUser!.uid,
              sendName: sendName,
              reportId: id,
              reason: _formKey.currentState?.value['reason'] ?? '',
              details: _formKey.currentState?.value['details'] ?? '',
              createdAt: DateTime.now()));
          Fluttertoast.showToast(
              msg: '$reportNameを報告しました',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 13.0);
        } catch (_) {
          Fluttertoast.showToast(
              msg: '報告に失敗しました',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13.0);
        } finally {
          Navigator.pop(context);
        }
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ユーザを報告'),
                      IconButton(onPressed: () => null, icon: Icon(Icons.close))
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    right: 3.0,
                  ),
                  children: [
                    SingleChildScrollView(
                      child: FormBuilder(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                FormBuilderDropdown(
                                    name: 'reason',
                                    autovalidateMode: AutovalidateMode.disabled,
                                    decoration: const InputDecoration(
                                        label: Text('報告の理由'),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context,
                                          errorText: '理由を入力して下さい'),
                                    ]),
                                    items: const [
                                      DropdownMenuItem(
                                          child: Text('理由を入力'), value: null),
                                      DropdownMenuItem(
                                          child: Text('ビジネス目的、スパムである'),
                                          value: 'ビジネス、スパム'),
                                      DropdownMenuItem(
                                          child: Text('アカウントが乗っ取られている'),
                                          value: '乗っ取り'),
                                      DropdownMenuItem(
                                          child: Text('なりすまし行為'),
                                          value: 'なりすまし'),
                                      DropdownMenuItem(
                                          child: Text(
                                              'プロフィールに猥褻な情報、暴言、脅迫、差別が含まれている'),
                                          value: 'プロフィール違反'),
                                      DropdownMenuItem(
                                          child: Text(
                                              'チャットの発言に猥褻な情報、暴言、脅迫、差別が含まれている'),
                                          value: 'チャット違反')
                                    ]),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                FormBuilderTextField(
                                    name: 'details',
                                    focusNode: FocusNode(),
                                    decoration: const InputDecoration(
                                        labelText: '詳細(任意)',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always),
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.maxLength(
                                          context, 1000,
                                          errorText: '詳細は1000文字以下です'),
                                    ]),
                                    maxLines: 3),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextButton(
                                  onPressed: () => userReport(),
                                  child: const Text('報告する'),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                )));
  }
}

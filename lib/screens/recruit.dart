import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/report/report.dart';
import 'package:duel_matching/model/request/request.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/recruit_provider.dart';
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
    return UserWhenConsumer(
        child: (myProfile) => RecruitWhenConsumer(
            id: id,
            child: (recruit) => MembersWhenConsumer(
                  id: id,
                  child: (members) => UserWhenConsumer(
                      id: recruit.organizerId,
                      child: (organizer) => FriendsWhenConsumer(
                          id: recruit.organizerId,
                          child: (organizerFriends) => Scaffold())),
                )));
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
}

import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

recruitAdd(
    {required BuildContext dialogContext,
    required GlobalKey<FormBuilderState> formKey,
    required Profile user,
    required void Function(String?) createAfter}) {
  formKey.currentState!.save();

  String? recruitId;

  if (formKey.currentState!.validate()) {
    try {
      recruitsCollection()
          .add(Recruit(
              title: formKey.currentState!.value['title'],
              playTitle: formKey.currentState!.value['playTitle'],
              format: formKey.currentState?.value['format'] ?? '',
              place: formKey.currentState!.value['place'],
              point: formKey.currentState!.value['point'],
              friendOnly: formKey.currentState!.value['friendOnly'],
              recruitNumber: formKey.currentState!.value['recruitNumber'],
              start: formKey.currentState!.value['start'],
              end: formKey.currentState!.value['end'],
              limit: formKey.currentState!.value['limit'],
              overview: formKey.currentState?.value['overview'] ?? '',
              memberCount: 0,
              full: false,
              cancel: false,
              close: false,
              organizerId: FirebaseAuth.instance.currentUser!.uid,
              membersId: [FirebaseAuth.instance.currentUser!.uid],
              createdAt: DateTime.now()))
          .then((docRef) async {
        recruitId = docRef.id;
        if (recruitId != null) {
          //作成した後の処理
          createAfter(recruitId);
        }
//作成者をメンバーに追加
        membersCollection(docRef.id)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
              Member(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  name: user.name,
                  avatar: user.avatar,
                  organizer: true,
                  noticeTitle: '${formKey.currentState!.value['title']} (1)',
                  createdAt: DateTime.now(),
                  noticeToken: user.noticeToken),
            );
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: '対戦募集の作成に失敗しました',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }
}

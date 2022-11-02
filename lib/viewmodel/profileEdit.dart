import 'dart:io';

import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Future<void> profileUpdate(
    {required GlobalKey<FormBuilderState> formKey,
    required String uid,
    required Profile user,
    XFile? headerImage,
    XFile? avatarImage,
    required List<String> playTitle,
    required BuildContext context}) async {
  formKey.currentState!.save();
  String? headerUrl;
  String? avatarUrl;
  if (headerImage != null) {
    try {
      await FirebaseStorage.instance
          .ref("headers/$uid.png")
          .putFile(File(headerImage.path));
      headerUrl = await FirebaseStorage.instance
          .ref("headers/$uid.png")
          .getDownloadURL();
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'ヘッダーのアップロードに失敗しました',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }

  if (avatarImage != null) {
    try {
      await FirebaseStorage.instance
          .ref("avatars/$uid.png")
          .putFile(File(avatarImage.path));
      avatarUrl = await FirebaseStorage.instance
          .ref("avatars/$uid.png")
          .getDownloadURL();
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'アバターのアップロードに失敗しました',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }

  if (formKey.currentState!.validate()) {
    try {
      await userDocument(uid).update({
        'header': headerUrl ?? user.header,
        'avatar': avatarUrl ?? user.avatar,
        'name': formKey.currentState!.value['name'],
        'comment': formKey.currentState!.value['comment'],
        'introduction': formKey.currentState!.value['introduction'],
        'favorite': formKey.currentState!.value['favorite'],
        'playTitle': playTitle,
        'remoteDuel': formKey.currentState!.value['remoteDuel'],
        'adress': formKey.currentState!.value['adress'],
        'activityDay': formKey.currentState!.value['activityDay'],
        'activityTime': formKey.currentState!.value['activityTime'],
        'age': formKey.currentState!.value['age'],
        'sex': formKey.currentState!.value['sex'],
        'initialSetting': true,
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'プロフィールの更新に失敗しました',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }
}

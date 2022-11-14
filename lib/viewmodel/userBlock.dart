import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/friendDelete.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

userBlock(
    {required BuildContext dialogContext,
    required String userId,
    required String userName,
    required bool isFriend}) async {
  try {
    await friendDocumentDelete(userId: userId, isFriend: isFriend);
    //自分のブロックリストに対象のIDを追加
    await userDocument(firebaseCurrentUserId).update({
      'blockList': FieldValue.arrayUnion([userId])
    });
    Fluttertoast.showToast(
        msg: '$userNameをブロックしました',
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

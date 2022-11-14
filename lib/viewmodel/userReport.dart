import 'package:duel_matching/freezed/report/report.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

//違反ユーザの報告
userReport(
    {required BuildContext dialogContext,
    required GlobalKey<FormBuilderState> formKey,
    required String sendName,
    required String reportId,
    required String reportName}) async {
  if (formKey.currentState!.validate()) {
    try {
      formKey.currentState!.save();
      await reportsCollection().add(Report(
          sendId: firebaseCurrentUserId,
          sendName: sendName,
          reportId: reportId,
          reason: formKey.currentState?.value['reason'] ?? '',
          details: formKey.currentState?.value['details'] ?? '',
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
      Navigator.pop(dialogContext);
    }
  }
}

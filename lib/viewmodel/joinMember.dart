import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

joinMember({
  required BuildContext context,
  required BuildContext dialogContext,
  required String recruitId,
  required Recruit recruit,
  required List<Member> members,
  required List<FriendWithId> organizerFriends,
  required Profile myProfile,
}) async {
  Navigator.pop(dialogContext);
  try {
    if (recruit.cancel ||
        (recruit.recruitNumber <= members.length - 1) ||
        recruit.limit!.isBefore(DateTime.now()) ||
        (recruit.friendOnly &&
            !organizerFriends
                .map((f) => f.uid)
                .toList()
                .contains(firebaseCurrentUserId)) ||
        (members.map((m) => m.uid).toList().contains(firebaseCurrentUserId))) {
      throw Exception();
    }
    await membersCollection(recruitId).doc(firebaseCurrentUserId).set(Member(
        uid: firebaseCurrentUserId,
        name: myProfile.name,
        avatar: myProfile.avatar ?? '',
        organizer: false,
        noticeToken: myProfile.noticeToken ?? [],
        noticeTitle: '${recruit.title} (${members.length + 1})',
        createdAt: DateTime.now()));
    GoRouter.of(context).push('/group/$recruitId');
    Fluttertoast.showToast(
        msg: '募集に参加しました',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 13.0);
  } catch (_) {
    Fluttertoast.showToast(
        msg: '参加に失敗しました',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 13.0);
  }
}

import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showTutorial({required BuildContext context, required Profile profile}) async {
  PendingDynamicLinkData? dynamicLinkData;
  final applinks = AppLinks();
  final Uri? getAppLinks = await applinks.getInitialAppLink();

  //iosが起動時のダイナミックリンクを取得しない(原因不明)のでapplinksで取得
  if (Platform.isIOS) {
    dynamicLinkData = getAppLinks != null
        ? await FirebaseDynamicLinks.instance.getDynamicLink(getAppLinks)
        : null;
  } else {
    dynamicLinkData = await FirebaseDynamicLinks.instance.getInitialLink();
  }
  // プロフィールの初期設定を完了していないアカウントは初期設定ページへ
  if (!profile.initialSetting) {
    if (dynamicLinkData != null) {
      GoRouter.of(context).go('/initial_edit?${dynamicLinkData.link.query}');
    } else {
      GoRouter.of(context).go('/initial_edit?');
    }
  } else {
    if (dynamicLinkData?.link.queryParameters['user'] != null) {
      if (dynamicLinkData?.link.queryParameters['user'] ==
          firebaseCurrentUserId) {
        GoRouter.of(context).push('/profile');
      } else {
        GoRouter.of(context)
            .push('/user/${dynamicLinkData!.link.queryParameters['user']}');
      }
    }
    if (dynamicLinkData?.link.queryParameters['recruit'] != null) {
      GoRouter.of(context).go('/recruits');

      GoRouter.of(context)
          .push('/recruit/${dynamicLinkData!.link.queryParameters['recruit']}');
    }
  }
}

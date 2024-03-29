import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_router/go_router.dart';

dynamicLinkListen(context) {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
    //ユーザページへ遷移
    if (dynamicLinkData.link.queryParameters['user'] != null) {
      await Future.delayed(
          const Duration(
            seconds: 1,
          ), () async {
        GoRouter.of(context).go('/users');
        //自分のIDの場合プロフィールへ
        if (dynamicLinkData.link.queryParameters['user'] ==
            firebaseCurrentUserId) {
          GoRouter.of(context).push('/profile');
        } else {
          GoRouter.of(context)
              .push('/user/${dynamicLinkData.link.queryParameters['user']}');
        }
      });
    }
    //対戦募集共有の遷移
    if (dynamicLinkData.link.queryParameters['recruit'] != null) {
      GoRouter.of(context).go('/recruits');

      GoRouter.of(context)
          .push('/recruit/${dynamicLinkData.link.queryParameters['recruit']}');
    }
  }).onError((error) {
    // Handle errors
  });
}

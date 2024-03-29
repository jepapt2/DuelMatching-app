import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../freezed/user_profile/user_profile.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            child: Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Consumer(builder: (context, ref, _) {
                UserProfile user =
                    ref.read(userProfileProvider(firebaseCurrentUserId));
                return user.profile!.when(
                  data: (profile) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AvatarImage(
                          avatar: profile.avatar,
                          radius: 25,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            profile.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  error: (Object error, StackTrace? stackTrace) {
                    return const SizedBox();
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              }),
              decoration:
                  const BoxDecoration(border: Border(bottom: BorderSide())),
            ),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(
                left: 5.0, right: 0.0, top: 0.0, bottom: 0.0),
            leading: const Icon(Icons.account_circle_rounded,
                color: Color(0xffff8e3c), size: 25.0),
            title: const Text('プロフィール確認'),
            onTap: () => GoRouter.of(context).push('/profile'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const Icon(Icons.manage_accounts_rounded,
                color: Color(0xffff8e3c), size: 25.0),
            title: const Text('プロフィール編集'),
            onTap: () => GoRouter.of(context).push('/profile_edit'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const FaIcon(FontAwesomeIcons.solidHandshake,
                color: Color(0xffff8e3c), size: 20),
            title: const Text('フレンドリスト'),
            onTap: () => GoRouter.of(context).push('/friends'),
          ),
          ListTile(
            horizontalTitleGap: 18,
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 9.0, right: 2.0),
            leading: const FaIcon(FontAwesomeIcons.solidFileLines,
                color: Color(0xffff8e3c), size: 23),
            title: const Text('参加済の対戦募集'),
            onTap: () => GoRouter.of(context).push('/joined'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const FaIcon(FontAwesomeIcons.userSlash,
                color: Color(0xffff8e3c), size: 18.0),
            title: const Text('ブロックリスト'),
            onTap: () => GoRouter.of(context).push('/block'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const Icon(Icons.subscriptions,
                color: Color(0xffff8e3c), size: 22.0),
            title: const Text('サブスクリプション'),
            onTap: () => GoRouter.of(context).push('/store'),
          ),
          Consumer(builder: (context, ref, _) {
            return ListTile(
              minLeadingWidth: 0.0,
              contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
              leading: const Icon(
                Icons.manage_accounts_rounded,
                color: Color(0xffff8e3c),
              ),
              title: const Text('アカウント・その他'),
              onTap: () {
                GoRouter.of(context).push('/account');
              },
            );
          }),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const Icon(
              Icons.reviews,
              color: Color(0xffff8e3c),
            ),
            title: const Text('このアプリをレビューする'),
            onTap: () {
              LaunchReview.launch(
                  androidAppId: "com.dairi.duelmatching",
                  iOSAppId: "1630632585");
            },
          ),
        ],
      ),
    );
  }
}

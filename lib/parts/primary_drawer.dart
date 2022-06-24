import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                UserProfile user = ref.read(userProfileProvider(
                    FirebaseAuth.instance.currentUser!.uid));
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
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            profile.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
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
            contentPadding: EdgeInsets.only(left: 5.0, right: 0.0),
            leading: Icon(
              Icons.manage_accounts_rounded,
              color: Color(0xffff8e3c),
            ),
            title: Text('ログアウト'),
            onTap: () => FirebaseAuth.instance.signOut(),
          )
        ],
      ),
    );
  }
}

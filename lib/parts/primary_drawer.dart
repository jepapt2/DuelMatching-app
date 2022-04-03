import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PrimaryDrawer extends StatelessWidget {
  PrimaryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text('drawer header'),
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(
                left: 5.0, right: 0.0, top: 0.0, bottom: 0.0),
            leading: const Icon(Icons.account_circle_rounded, size: 25.0),
            title: const Text('プロフィール確認'),
            onTap: () => GoRouter.of(context).push('/profile'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const Icon(Icons.manage_accounts_rounded, size: 25.0),
            title: const Text('プロフィール編集'),
            onTap: () => GoRouter.of(context).push('/profile_edit'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: const EdgeInsets.only(left: 5.0, right: 0.0),
            leading: const FaIcon(FontAwesomeIcons.userSlash, size: 20.0),
            title: const Text('ブロックリスト'),
            onTap: () => GoRouter.of(context).push('/block'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: EdgeInsets.only(left: 5.0, right: 0.0),
            leading: Icon(Icons.manage_accounts_rounded),
            title: Text('ログアウト'),
            onTap: () => FirebaseAuth.instance.signOut(),
          )
        ],
      ),
    );
  }
}

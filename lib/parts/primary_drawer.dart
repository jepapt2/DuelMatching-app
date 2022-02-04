import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrimaryDrawer extends StatelessWidget {
  PrimaryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('drawer header'),
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding:
                EdgeInsets.only(left: 5.0, right: 0.0, top: 0.0, bottom: 0.0),
            leading: Icon(Icons.account_circle_rounded),
            title: const Text('プロフィール確認'),
            onTap: () => GoRouter.of(context).push('/users'),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            contentPadding: EdgeInsets.only(left: 5.0, right: 0.0),
            leading: Icon(Icons.manage_accounts_rounded),
            title: Text('プロフィール編集'),
            onTap: () => GoRouter.of(context).push('/profile_edit'),
          )
        ],
      ),
    );
  }
}

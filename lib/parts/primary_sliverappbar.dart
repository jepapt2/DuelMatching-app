import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class PrimarySliverAppBar extends StatelessWidget {
  PrimarySliverAppBar({Key? key, this.appBarText, this.appBarAction})
      : super(key: key);

  final String? appBarText;
  final List<Widget>? appBarAction;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(appBarText ?? ''),
      floating: true,
      snap: true,
      leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: UserAvatar(
            auth: FirebaseAuth.instance,
          )),
      actions: appBarAction,
      expandedHeight: 10,
    );
  }
}

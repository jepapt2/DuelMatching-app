import 'package:duel_matching/extension/string.dart';
import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimarySliverAppBar extends HookWidget {
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
          icon: Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(
                  profileProvider(FirebaseAuth.instance.currentUser!.uid));

              ImageProvider<Object> avatarImage(String? avatar) {
                if (avatar.isNotNullAndNotEmpty) {
                  return NetworkImage(avatar!);
                } else {
                  return const AssetImage('assets/images/initial_avatar.png');
                }
              }

              return CircleAvatar(
                backgroundColor: const Color(0xffeff0f3),
                radius: 50,
                backgroundImage: avatarImage(user.value?.avatar),
              );
            },
          )),
      actions: appBarAction,
      expandedHeight: 10,
    );
  }
}

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PrimarySliverAppBar extends HookWidget {
  const PrimarySliverAppBar(
      {Key? key, required this.user, this.appBarText, this.appBarAction})
      : super(key: key);

  final Profile user;
  final String? appBarText;
  final List<Widget>? appBarAction;

  @override
  Widget build(BuildContext context) {
    final avatarState = useState<String?>(user.avatar);
    return SliverAppBar(
      title: Text(appBarText ?? ''),
      floating: true,
      snap: true,
      leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: AvatarImage(
            avatar: user.avatar,
            radius: 25,
          )),
      actions: appBarAction,
      expandedHeight: 10,
    );
  }
}

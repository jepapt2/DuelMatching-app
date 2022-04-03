import 'package:flutter/material.dart';
import 'package:duel_matching/extension/string.dart';

ImageProvider<Object> avatarImage(String? avatar) {
  if (avatar.isNotNullAndNotEmpty) {
    return NetworkImage(avatar!);
  } else {
    return const AssetImage('assets/images/initial_avatar.png');
  }
}

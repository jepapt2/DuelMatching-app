import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:duel_matching/viewmodel/network_detector_notifier.dart';
import 'package:flutter/material.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({Key? key, this.avatar, this.radius}) : super(key: key);

  final String? avatar;
  final double? radius;

  ImageProvider selectProvider(avatar) {
    try {
      return CachedNetworkImageProvider(
        avatar!,
      );
    } catch (_) {
      return const AssetImage('assets/images/initial_avatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var network = ref.watch(networkAwareProvider);

      if (network == NetworkStatus.On && avatar.isNotNullAndNotEmpty) {
        return CircleAvatar(
          backgroundColor: const Color(0xffeff0f3),
          foregroundColor: const Color(0xff2a2a2a),
          radius: radius,
          foregroundImage: selectProvider(
            avatar!,
          ),
        );
      }
      return CircleAvatar(
        backgroundColor: const Color(0xffeff0f3),
        foregroundColor: const Color(0xff2a2a2a),
        radius: radius,
        foregroundImage: const AssetImage('assets/images/initial_avatar.png'),
      );
    });
  }
}

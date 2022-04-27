import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:duel_matching/extension/string.dart';

class AvatarImage extends StatefulWidget {
  const AvatarImage({Key? key, this.avatar, this.radius}) : super(key: key);

  final String? avatar;
  final double? radius;

  @override
  State<AvatarImage> createState() => _AvatarImageState();
}

class _AvatarImageState extends State<AvatarImage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    result = await _connectivity.checkConnectivity();

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  selectImage() {
    if (_connectionStatus != ConnectivityResult.none &&
        widget.avatar.isNotNullAndNotEmpty) {
      return CachedNetworkImageProvider((widget.avatar!));
    } else {
      return const AssetImage('assets/images/initial_avatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffeff0f3),
      foregroundColor: const Color(0xff2a2a2a),
      radius: widget.radius,
      foregroundImage: selectImage(),
    );
  }
}

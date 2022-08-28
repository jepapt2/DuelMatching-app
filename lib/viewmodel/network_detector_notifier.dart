import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { NotDetermined, On, Off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  late NetworkStatus lastResult;

  NetworkDetectorNotifier() : super(NetworkStatus.NotDetermined) {
    lastResult = NetworkStatus.NotDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      NetworkStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
          newState = NetworkStatus.On;
          break;
        case ConnectivityResult.wifi:
          newState = NetworkStatus.On;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.Off;

          break;
        default:
          newState = NetworkStatus.On;
          break;
      }

      if (newState != state) {
        state = newState;
      }
    });
  }
}

final networkAwareProvider =
    StateNotifierProvider<NetworkDetectorNotifier, NetworkStatus>((ref) {
  return NetworkDetectorNotifier();
});

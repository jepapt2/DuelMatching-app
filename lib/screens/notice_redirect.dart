import 'package:duel_matching/viewmodel/purchases_notifier.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class InheritedNavigator extends InheritedWidget {
  const InheritedNavigator({Key? key, required this.child})
      : super(key: key, child: child);

  @override
  final Widget child;

  static InheritedNavigator? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedNavigator>();
  }

  @override
  bool updateShouldNotify(InheritedNavigator oldWidget) {
    return true;
  }
}

class NoticeRedirect extends ConsumerWidget {
  const NoticeRedirect({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    //課金ユーザの確認
    var purchases = ref.watch(purchasesNotifierProvider.notifier);
    Purchases.addPurchaserInfoUpdateListener(purchases.purchaserInfoUpdated);
//通知を開いた時の遷移
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      GoRouter.of(context).go('/notice');
      if (message.data['chatRoomId'] != null) {
        GoRouter.of(context).go('/messages');
        GoRouter.of(context).push('/chatRoom/${message.data['chatRoomId']}');
      } else if (message.data['groupId'] != null) {
        GoRouter.of(context).go('/messages');
        GoRouter.of(context).push('/group/${message.data['groupId']}');
      } else if (message.data['recruitId'] != null) {
        GoRouter.of(context).go('/notice');
        GoRouter.of(context).push('/recruit/${message.data['recruitId']}');
      } else {
        GoRouter.of(context).go('/notice');
      }
    });
    return Builder(builder: (context) {
      return child;
    });
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class NoticeRedirect extends StatelessWidget {
  const NoticeRedirect({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      GoRouter.of(context).go('/notice');
      if (message.data['chatRoomId'] != null) {
        GoRouter.of(context).push('/chatRoom/${message.data['chatRoomId']}');
      } else if (message.data['groupId'] != null) {
        GoRouter.of(context).push('/group/${message.data['groupId']}');
      }
    });
    return Builder(builder: (context) {
      return child;
    });
  }
}

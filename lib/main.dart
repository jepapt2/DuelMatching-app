import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/router.dart';
import 'package:duel_matching/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:duel_matching/gen/firebase_options_development.dart'
    as development;
import 'package:duel_matching/gen/firebase_options_production.dart'
    as production;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'local/fluttefire.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: getFirebaseOptions());
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  final token = await FirebaseMessaging.instance.getToken();
  print('🐯 FCM TOKEN: $token');
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

FirebaseOptions getFirebaseOptions() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'development':
      return development.DefaultFirebaseOptions.currentPlatform;
    case 'production':
      return production.DefaultFirebaseOptions.currentPlatform;
    default:
      throw ArgumentError('Not available flavor');
  }
}

final loginProvider = ChangeNotifierProvider((ref) => LoginNotifier());

class LoginNotifier extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
}

class MyApp extends HookWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // トークンの取得

      Future(() async {
        if (FirebaseAuth.instance.currentUser != null) {
          final token = await FirebaseMessaging.instance.getToken();
          userDocument(FirebaseAuth.instance.currentUser!.uid).update({
            'activeAt': DateTime.now().toUtc(),
            'noticeToken': FieldValue.arrayUnion([token])
          });
        }
      });
    }, const []);

    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        final token = await FirebaseMessaging.instance.getToken();

        userDocument(user.uid).update({
          'activeAt': DateTime.now(),
          'noticeToken': FieldValue.arrayUnion([token])
        });
      }
    });

    return MaterialApp.router(
      localizationsDelegates: [
        FlutterFireUILocalizations.withDefaultOverrides(const LabelOverrides()),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
      ],
      // supportedLocales: const [
      //   Locale("ja", "JP"),
      // ],
      title: 'DuelMatching',
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: appTheme(),
    );
  }
}

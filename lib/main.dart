import 'package:duel_matching/screens/login.dart';
import 'package:duel_matching/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:duel_matching/gen/firebase_options_development.dart'
    as development;
import 'package:duel_matching/gen/firebase_options_production.dart'
    as production;

import 'local/fluttefire.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: getFirebaseOptions());
  runApp(MyApp());
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

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        localizationsDelegates: [
          FlutterFireUILocalizations.withDefaultOverrides(
              const LabelOverrides()),

          // Delegates below take care of built-in flutter widgets
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

          // This delegate is required to provide the labels that are not overriden by LabelOverrides
          FlutterFireUILocalizations.delegate,
        ],
        title: 'DuelMatching',
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: appTheme());
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
    ],
    initialLocation: '/',
  );
}

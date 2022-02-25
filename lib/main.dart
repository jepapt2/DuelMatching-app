import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/router.dart';
import 'package:duel_matching/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:duel_matching/gen/firebase_options_development.dart'
    as development;
import 'package:duel_matching/gen/firebase_options_production.dart'
    as production;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'local/fluttefire.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: getFirebaseOptions());
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
      if (FirebaseAuth.instance.currentUser != null) {
        userDocument(FirebaseAuth.instance.currentUser!.uid)
            .update({'activeAt': DateTime.now()});
      }
    }, const []);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        userDocument(user.uid).update({'activeAt': DateTime.now()});
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

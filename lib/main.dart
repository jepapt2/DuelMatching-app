import 'package:app_links/app_links.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/gen/revenuecat_options.dart';
import 'package:duel_matching/router.dart';
import 'package:duel_matching/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
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
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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
  await Purchases.setup(getRevenueCatApi());
  Purchases.setDebugLogsEnabled(
      const String.fromEnvironment('FLAVOR') == 'development');
  Purchases.addPurchaserInfoUpdateListener(_purchaserInfoUpdated);
  MobileAds.instance.initialize();

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

void _purchaserInfoUpdated(PurchaserInfo info) {
  print('purchaserInfoUpdated: $info');
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

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
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

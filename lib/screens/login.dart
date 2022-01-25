import 'dart:io';

import 'package:duel_matching/gen/google_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  String getclientId() {
    const flavor = String.fromEnvironment('FLAVOR');
    switch (flavor) {
      case 'development':
        return googleClientIdDevelopment;
      case 'production':
        return googleClientIdProduction;
      default:
        throw ArgumentError('Not available flavor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/logo.png')),
              Visibility(
                visible: Platform.isAndroid,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GoogleSignInButton(clientId: getclientId()),
                ),
              ),
              Visibility(
                visible: Platform.isIOS,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppleSignInButton(
                    action: AuthAction.signIn,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TwitterSignInButton(
                    apiKey: 'apiKey',
                    apiSecretKey: 'apiSecretKey',
                    redirectUri: 'redirectUri'),
              ),
              TextButton(
                  onPressed: () => print(FirebaseAuth.instance.currentUser),
                  child: Text('ユーザー')),
              TextButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text('ユーザー')),
            ],
          ),
        ),
      ),
    );
  }
}

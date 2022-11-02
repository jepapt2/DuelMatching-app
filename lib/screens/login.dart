import 'dart:io';

import 'package:duel_matching/gen/google_options.dart';
import 'package:duel_matching/gen/twitter_options.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Map<String, String> getOption() {
    const flavor = String.fromEnvironment('FLAVOR');
    switch (flavor) {
      case 'development':
        return {
          'GoogleClient': googleClientIdDevelopment,
          'twitterApiKey': twitterApiKeyDevelopment,
          'twitterApiSecret': twitterApiSecretDevelopment,
          'twitterCallBack': twitterCallBackDevelopment
        };
      case 'production':
        return {
          'GoogleClient': googleClientIdProduction,
          'twitterApiKey': twitterApiKeyProduction,
          'twitterApiSecret': twitterApiSecretProduction,
          'twitterCallBack': twitterCallBackProduction
        };
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
                  child: GoogleSignInButton(
                      clientId: getOption()['GoogleClient']!),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TwitterSignInButton(
                  apiKey: getOption()['twitterApiKey']!,
                  apiSecretKey: getOption()['twitterApiSecret']!,
                  redirectUri: getOption()['twitterCallBack']!,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () =>
                          launchUrl(Uri.parse('https://duelmatching.com/tos')),
                      child: const Text(
                        '利用規約',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                  TextButton(
                      onPressed: () => launchUrl(
                          Uri.parse('https://duelmatching.com/policie')),
                      child: const Text(
                        'プライバシーポリシー',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

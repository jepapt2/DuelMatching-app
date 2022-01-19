import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/logo.png')),
              GoogleSignInButton(clientId: 'clientId')
            ],
          ),
        ),
      ),
    );
  }
}

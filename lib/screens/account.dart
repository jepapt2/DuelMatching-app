import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: ListView(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          children: [
            ListTile(
              title: const Text('ログアウト'),
              onTap: () => logoutDialog(context),
            ),
            const Divider(),
            ListTile(
              title: const Text('アカウント削除'),
              onTap: () => deleteDialog(context),
            ),
            const Divider(),
            ListTile(
              title: const Text('利用規約'),
              onTap: () => launchUrl(Uri.parse('https://duelmatching.com/tos')),
            ),
            const Divider(),
            ListTile(
              title: const Text('プライバシーポリシー'),
              onTap: () =>
                  launchUrl(Uri.parse('https://duelmatching.com/policie')),
            ),
            const Divider(),
          ]),
    );
  }

  logoutDialog(BuildContext context) {
    logout(dialogContext) async {
      Navigator.pop(dialogContext);
      //providerをdisposeするために一旦ログアウトスクリーンへ遷移
      GoRouter.of(context).go('/logout');
      Future.delayed(
          const Duration(
            seconds: 1,
          ), () async {
        if (!await Purchases.isAnonymous) {
          await Purchases.logOut();
        }
        await FirebaseAuth.instance.signOut();
      });
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('ログアウトしますか？'),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => logout(dialogContext),
                  ),
                ],
              );
            }));
  }

  deleteDialog(BuildContext context) {
    delete(dialogContext) async {
      _formKey.currentState!.save();
      if (_formKey.currentState!.validate()) {
        Navigator.pop(dialogContext);
        //providerをdisposeするために一旦ログアウトスクリーンへ遷移
        GoRouter.of(context).go('/logout');
        Future.delayed(
            const Duration(
              seconds: 10,
            ), () async {
          if (!await Purchases.isAnonymous) {
            await Purchases.logOut();
          }
          final func = FirebaseFunctions.instanceFor(region: 'asia-northeast1')
              .httpsCallable('user-deleteUser');
          await func.call({
            'id': firebaseCurrentUserId,
          });
          await FirebaseAuth.instance.signOut();
        });
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            builder: (dialogContext) {
              return SimpleDialog(
                title: const Text('アカウント削除'),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('「アカウント削除」\nをフォームに入力し削除をタップ'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: FormBuilderTextField(
                        name: 'deleteText',
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.match(context, 'アカウント削除',
                              errorText: '入力内容が違います'),
                          FormBuilderValidators.required(context,
                              errorText: '入力内容が違います')
                        ]),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text("削除"),
                    onPressed: () => delete(dialogContext),
                  ),
                ],
              );
            }));
  }
}

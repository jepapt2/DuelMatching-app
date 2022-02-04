import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileEditScreen extends HookConsumerWidget {
  ProfileEditScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile =
        ref.watch(userProfileProvider(FirebaseAuth.instance.currentUser!.uid));
    final profile = userProfile.profile;
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール編集'),
        actions: [
          TextButton(onPressed: () => null, child: Text('保存')),
          TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('ログアウト'))
        ],
      ),
      body: profile!.when(
          data: (user) {
            return Container(
              child: FormBuilder(
                  child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    initialValue: user!.name,
                  )
                ],
              )),
            );
          },
          error: (error, stack) => const Text('エラー'),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

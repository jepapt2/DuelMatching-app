import 'dart:io';

import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/avatarInput.dart';
import 'package:duel_matching/parts/headerInput.dart';
import 'package:duel_matching/screens/my_profile.dart';
import 'package:duel_matching/viewmodel/profileEdit.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duel_matching/extension/string.dart';

class ProfileEditScreen extends HookConsumerWidget {
  ProfileEditScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputHeaderImage = useState<XFile?>(null);
    final inputAvatarImage = useState<XFile?>(null);
    final tooltipControllerNotifier =
        ref.watch(myprofileTooltipProvider.notifier);

    final ScrollController _playTitleController = ScrollController();

    return UserWhenConsumer(
      child: (user) {
        final inputPlayTitle = useState<List<String>>([]);
        useEffect(() {
          //既存のプレイしているタイトル設定を代入
          inputPlayTitle.value = user.playTitle ?? [];
        }, const []);
        return Scaffold(
          appBar: AppBar(
            title: const Text('プロフィール編集'),
            actions: [
              TextButton(
                  onPressed: () async {
                    //プロフィールを保存した後SNSシェア案内のツールチップ表示
                    await profileUpdate(
                            formKey: _formKey,
                            uid: FirebaseAuth.instance.currentUser!.uid,
                            user: user,
                            headerImage: inputHeaderImage.value,
                            avatarImage: inputAvatarImage.value,
                            playTitle: inputPlayTitle.value,
                            context: context)
                        .then((_) {
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push('/profile');
                    });
                    Future.delayed(
                        const Duration(seconds: 1),
                        () => tooltipControllerNotifier.state
                            .showTooltip(autoClose: true, immediately: false));
                  },
                  child: const Text('保存')),
            ],
          ),
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
                    const SizedBox(
                      height: 250,
                    ),
                    headerInput(context, inputHeaderImage, user.header),
                    Positioned(
                        bottom: 0,
                        child: avatarInput(
                            context, inputAvatarImage, user.avatar)),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          initialValue: user.name,
                          decoration:
                              const InputDecoration(labelText: 'ニックネーム'),
                          autovalidateMode: AutovalidateMode.always,
                          maxLength: 15,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: 'ニックネームを入力してください'),
                            FormBuilderValidators.maxLength(context, 15,
                                errorText: 'ニックネームは15文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'comment',
                          initialValue: user.comment,
                          decoration: const InputDecoration(labelText: 'ひとこと'),
                          autovalidateMode: AutovalidateMode.always,
                          maxLength: 30,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 30,
                                errorText: 'ひとことは30文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                            name: 'introduction',
                            initialValue: user.introduction,
                            maxLength: 1000,
                            decoration:
                                const InputDecoration(labelText: '自己紹介'),
                            autovalidateMode: AutovalidateMode.always,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.maxLength(context, 1000,
                                  errorText: '自己紹介は1000文字以下です'),
                            ]),
                            maxLines: 5),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'favorite',
                          initialValue: user.favorite,
                          decoration: const InputDecoration(
                            labelText: '好きなカード',
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          maxLength: 141,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 141,
                                errorText: '好きなカードは141文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'プレイしているタイトル',
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                            ),
                            Text(
                              '(プレイする頻度が高い順で入力してください)',
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle
                                  ?.copyWith(fontSize: 12.0),
                            ),
                            SizedBox(
                              height: 100.0,
                              child: Scrollbar(
                                controller: _playTitleController,
                                thumbVisibility: true,
                                child: ListView(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    controller: _playTitleController,
                                    scrollDirection: Axis.horizontal,
                                    children: playTitleOption
                                        .map((t) => TextButton(
                                            onPressed: () {
                                              // ignore: prefer_collection_literals
                                              inputPlayTitle.value = [
                                                ...inputPlayTitle.value,
                                                t
                                              ].toSet().toList();
                                            },
                                            child: Text(t)))
                                        .toList()),
                              ),
                            ),
                            Wrap(
                                spacing: 7.0,
                                children: inputPlayTitle.value
                                    .map((t) => InputChip(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        label: Text(t),
                                        onDeleted: () =>
                                            inputPlayTitle.value = [
                                              ...inputPlayTitle.value
                                            ]..remove(t)))
                                    .toList()),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        FormBuilderSwitch(
                          name: 'remoteDuel',
                          title: Text(
                            'リモート対戦環境',
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle,
                          ),
                          initialValue: user.remoteDuel ?? false,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderDropdown(
                          name: 'adress',
                          decoration: const InputDecoration(
                            labelText: '居住地',
                          ),
                          initialValue: user.adress.isNotNullAndNotEmpty
                              ? user.adress
                              : '東京都',
                          items: adressOption
                              .map((a) => DropdownMenuItem(
                                    child: Text(a),
                                    value: a,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'activityDay',
                          initialValue: user.activityDay,
                          decoration: const InputDecoration(
                            labelText: '活動日',
                          ),
                          maxLength: 10,
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 10,
                                errorText: '活動日は10文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'activityTime',
                          initialValue: user.activityTime,
                          decoration: const InputDecoration(
                            labelText: '活動時間',
                          ),
                          maxLength: 10,
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 10,
                                errorText: '活動時間は10文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'age',
                          initialValue: user.age,
                          decoration: const InputDecoration(
                            labelText: '年齢',
                          ),
                          maxLength: 5,
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 5,
                                errorText: '年齢は5文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: 'sex',
                          initialValue: user.sex,
                          decoration: const InputDecoration(
                            labelText: '性別',
                          ),
                          maxLength: 10,
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 10,
                                errorText: '性別は10文字以内です'),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  playTitleOnDeleted(List<String> playTitle, String removeTitle) {
    List<String> removedTitle = [...playTitle];
    removedTitle.remove(removeTitle);
    playTitle = [...removedTitle];
  }
}

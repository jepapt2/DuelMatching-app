import 'package:duel_matching/freezed/member/member.dart';
import 'package:duel_matching/freezed/recruit/recruit.dart';
import 'package:duel_matching/parts/text.dart';
import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecruitNewScreen extends HookConsumerWidget {
  RecruitNewScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserWhenConsumer(
      child: (user) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('対戦募集の作成'),
            actions: [
              TextButton(
                  onPressed: () => recruitAddDialog(user, context),
                  child: const Text('保存')),
            ],
          ),
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FormBuilderTextField(
                          name: 'title',
                          decoration:
                              InputDecoration(label: getRequiredLabel('タイトル')),
                          maxLength: 30,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '名前を入力してください'),
                            FormBuilderValidators.maxLength(context, 30,
                                errorText: 'タイトルは30文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderDropdown(
                          name: 'playTitle',
                          initialValue: user.playTitle?.first ?? '遊戯王',
                          items: [
                            ...playTitleOption
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            const DropdownMenuItem(
                              child: Text('その他'),
                              value: 'その他',
                            )
                          ],
                          decoration: InputDecoration(
                              label: getRequiredLabel('プレイするタイトル')),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: 'プレイするタイトルを入力して下さい'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          name: 'format',
                          decoration:
                              const InputDecoration(label: Text('対戦形式')),
                          maxLength: 15,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 30,
                                errorText: '対戦形式は15文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderDropdown(
                          name: 'place',
                          initialValue: user.adress ?? '東京都',
                          decoration: InputDecoration(
                              label: getRequiredLabel('対戦する場所')),
                          items: [
                            ...adressOption
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            const DropdownMenuItem(
                              child: Text('オンライン'),
                              value: 'オンライン',
                            )
                          ],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '都道府県を入力してください'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          name: 'point',
                          decoration:
                              InputDecoration(label: getRequiredLabel('詳細な場所')),
                          maxLength: 50,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '詳細な場所を入力してください'),
                            FormBuilderValidators.maxLength(context, 50,
                                errorText: '詳細な場所は50文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderDropdown(
                            name: 'recruitNumber',
                            initialValue: 1,
                            decoration: InputDecoration(
                                label: getRequiredLabel('募集人数')),
                            items: [
                              for (int i = 1; i <= 15; i++)
                                DropdownMenuItem(
                                  child: Text(i.toString()),
                                  value: i,
                                )
                            ]),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderSwitch(
                          name: 'friendOnly',
                          initialValue: false,
                          decoration:
                              const InputDecoration(label: Text('募集範囲')),
                          title: const Text(
                            'フレンドのみ',
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderDateTimePicker(
                          name: 'start',
                          locale: const Locale('ja'),
                          decoration:
                              InputDecoration(label: getRequiredLabel('開始時間')),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '開始時間を入力してください'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderDateTimePicker(
                          name: 'end',
                          locale: const Locale('ja'),
                          decoration:
                              const InputDecoration(label: Text('終了時間')),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderDateTimePicker(
                          name: 'limit',
                          locale: const Locale('ja'),
                          decoration:
                              InputDecoration(label: getRequiredLabel('募集期限')),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '募集期限を入力してください'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          name: 'overview',
                          decoration: const InputDecoration(
                            labelText: '概要',
                          ),
                          maxLength: 1000,
                          maxLines: 4,
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 1000,
                                errorText: '概要は1000文字以下です'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
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

  recruitAddDialog(Profile user, BuildContext context) async {
    recruitAdd(dialogContext) {
      _formKey.currentState!.save();

      String? recruitId;

      if (_formKey.currentState!.validate()) {
        try {
          recruitsCollection()
              .add(Recruit(
                  title: _formKey.currentState!.value['title'],
                  playTitle: _formKey.currentState!.value['playTitle'],
                  format: _formKey.currentState?.value['format'] ?? '',
                  place: _formKey.currentState!.value['place'],
                  point: _formKey.currentState!.value['point'],
                  friendOnly: _formKey.currentState!.value['friendOnly'],
                  recruitNumber: _formKey.currentState!.value['recruitNumber'],
                  start: _formKey.currentState!.value['start'],
                  end: _formKey.currentState!.value['end'],
                  limit: _formKey.currentState!.value['limit'],
                  overview: _formKey.currentState?.value['overview'] ?? '',
                  memberCount: 0,
                  full: false,
                  cancel: false,
                  close: false,
                  organizerId: FirebaseAuth.instance.currentUser!.uid,
                  membersId: [FirebaseAuth.instance.currentUser!.uid],
                  createdAt: DateTime.now()))
              .then((docRef) async {
            recruitId = docRef.id;
            if (recruitId != null) {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
              GoRouter.of(context).push('/recruit/$recruitId');
            }
            return await membersCollection(docRef.id)
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set(
                  Member(
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      name: user.name,
                      avatar: user.avatar,
                      organizer: true,
                      noticeTitle:
                          '${_formKey.currentState!.value['title']} (1)',
                      createdAt: DateTime.now(),
                      noticeToken: user.noticeToken),
                );
          });
        } catch (e) {
          Fluttertoast.showToast(
              msg: '対戦募集の作成に失敗しました',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13.0);
        }
      }
    }

    return Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('対戦募集の開始'),
                content: const Text("一度作成した募集は変更できません。\nこの内容で作成しますか？"),
                actions: [
                  TextButton(
                    child: const Text("いいえ"),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  TextButton(
                    child: const Text("はい"),
                    onPressed: () => recruitAdd(dialogContext),
                  ),
                ],
              );
            }));
  }
}

import 'dart:io';

import 'package:duel_matching/extension/string.dart';
import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/headerInput.dart';
import 'package:duel_matching/screens/my_profile.dart';
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

import '../input_options/adress.dart';
import '../input_options/play_title.dart';
import '../parts/avatarInput.dart';
import '../parts/text.dart';

class InitialEditScreen extends HookConsumerWidget {
  InitialEditScreen({Key? key, this.userQuery, this.recruitQuery})
      : super(key: key);

  final String? userQuery;
  final String? recruitQuery;
  final _formKey = GlobalKey<FormBuilderState>();
  final ScrollController _playTitleController = ScrollController();

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final Size mediaSize = MediaQuery.of(context).size;
    final pageState = useState(0);
    final loading = useState(false);
    final inputHeaderImage = useState<XFile?>(null);
    final inputAvatarImage = useState<XFile?>(null);
    final tooltipControllerNotifier =
        ref.watch(myprofileTooltipProvider.notifier);

    return UserWhenConsumer(
        id: FirebaseAuth.instance.currentUser!.uid,
        child: (user) {
          final inputPlayTitle = useState<List<String>>([]);
          useEffect(() {
            inputPlayTitle.value = user.playTitle ?? [];
          }, const []);
          return FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scaffold(
              floatingActionButton: Padding(
                padding: EdgeInsets.only(bottom: mediaSize.height / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: pageState.value != 0,
                      child: FloatingActionButton(
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xfffffffe),
                            size: 30,
                          ),
                          onPressed: () async {
                            if (!loading.value) {
                              loading.value = true;
                              if (pageState.value == 4) {
                                Future.delayed(
                                    const Duration(seconds: 1),
                                    () => tooltipControllerNotifier.state
                                        .hideTooltip(immediately: false));
                              }
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                pageState.value--;
                                await controller.previousPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                              }
                              loading.value = false;
                            }
                          }),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xfffffffe),
                          size: 30,
                        ),
                        onPressed: () async {
                          if (!loading.value) {
                            loading.value = true;

                            if (pageState.value == 3) {
                              try {
                                pageState.value++;
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);

                                Future.delayed(
                                    const Duration(seconds: 1),
                                    () => tooltipControllerNotifier.state
                                        .showTooltip(
                                            autoClose: true,
                                            immediately: false));
                                await profileUpdate(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    user,
                                    inputHeaderImage.value,
                                    inputAvatarImage.value,
                                    inputPlayTitle.value,
                                    pageState,
                                    controller);
                              } catch (e) {}
                            } else if (pageState.value == 4) {
                              if (userQuery != null) {
                                GoRouter.of(context).go('/users');
                                if (userQuery !=
                                    FirebaseAuth.instance.currentUser!.uid) {
                                  GoRouter.of(context).push('/user/$userQuery');
                                }
                              } else if (recruitQuery != null) {
                                GoRouter.of(context).go('/recruits');
                                GoRouter.of(context)
                                    .push('/recruit/$recruitQuery');
                              } else {
                                GoRouter.of(context).go('/users');
                              }
                            } else {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                pageState.value++;
                                await controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                              }
                            }
                            loading.value = false;
                          }
                        }),
                  ],
                ),
              ),
              body: SafeArea(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //1ページ
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mediaSize.height * 0.2,
                            ),
                            const Text(
                              'ニックネームを入力してください',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2a2a2a),
                              ),
                            ),
                            SizedBox(
                              height: mediaSize.height * 0.08,
                            ),
                            FormBuilderTextField(
                              name: 'name',
                              initialValue: user.name,
                              autovalidateMode: AutovalidateMode.always,
                              maxLength: 15,
                              decoration: InputDecoration(
                                label: getRequiredLabel(''),
                              ),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: '名前を入力してください'),
                                FormBuilderValidators.maxLength(context, 15,
                                    errorText: '名前は15文字以下です'),
                              ]),
                            ),
                            const Text(
                              '※プロフィールはあとから変更できます',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //2ページ
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: mediaSize.height * 0.15,
                              ),
                              const Text(
                                'プレイしているタイトルを\n入力してください',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2a2a2a),
                                ),
                              ),
                              Text(
                                '(プレイする頻度が高い順で入力してください)',
                                style: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle
                                    ?.copyWith(fontSize: 15.0),
                              ),
                              SizedBox(height: mediaSize.height * 0.025),
                              Container(
                                color: Color(0xffeff0f3),
                                child: SizedBox(
                                  height: 80.0,
                                  child: Scrollbar(
                                    controller: _playTitleController,
                                    thumbVisibility: true,
                                    child: ListView(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
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
                                                child: Text(
                                                  t,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                )))
                                            .toList()),
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaSize.height * 0.025),
                              Wrap(
                                  spacing: 5.0,
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
                            ]),
                      ),
                    ),
                    //3ページ
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mediaSize.height * 0.2,
                            ),
                            const Text(
                              '居住地を入力してください',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2a2a2a),
                              ),
                            ),
                            SizedBox(
                              height: mediaSize.height * 0.08,
                            ),
                            FormBuilderDropdown(
                              name: 'adress',
                              initialValue: user.adress.isNotNullAndNotEmpty
                                  ? user.adress
                                  : '東京都',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0xff2a2a2a),
                              ),
                              items: adressOption
                                  .map((a) => DropdownMenuItem(
                                        child: Text(a),
                                        value: a,
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //4ページ
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mediaSize.height * 0.03,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'プロフィールを充実させましょう(任意)',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2a2a2a),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaSize.height * 0.03,
                          ),
                          Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                const SizedBox(
                                  height: 250,
                                ),
                                headerInput(
                                    context, inputHeaderImage, user.header),
                                Positioned(
                                    bottom: 0,
                                    child: avatarInput(context,
                                        inputAvatarImage, user.avatar)),
                              ]),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                FormBuilderTextField(
                                  name: 'comment',
                                  initialValue: user.comment,
                                  decoration:
                                      const InputDecoration(labelText: 'ひとこと'),
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
                                    decoration: const InputDecoration(
                                        labelText: '自己紹介'),
                                    maxLength: 1000,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.maxLength(
                                          context, 1000,
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
                                  maxLength: 141,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.maxLength(
                                        context, 141,
                                        errorText: '好きなカードは141文字以下です'),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 10.0,
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
                                SizedBox(
                                  height: mediaSize.height * 0.3,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //5ページ目
                    if (pageState.value == 4)
                      MyProfileScreen(
                        id: FirebaseAuth.instance.currentUser!.uid,
                        initialEdit: true,
                      )
                    else
                      Container()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> profileUpdate(
    String uid,
    Profile user,
    XFile? headerImage,
    XFile? avatarImage,
    List<String> playTitle,
    ValueNotifier<int> pageState,
    PageController controller,
  ) async {
    _formKey.currentState!.save();
    String? headerUrl;
    String? avatarUrl;
    if (headerImage != null) {
      try {
        await FirebaseStorage.instance
            .ref("headers/$uid.png")
            .putFile(File(headerImage.path));
        headerUrl = await FirebaseStorage.instance
            .ref("headers/$uid.png")
            .getDownloadURL();
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'ヘッダーのアップロードに失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    if (avatarImage != null) {
      try {
        await FirebaseStorage.instance
            .ref("avatars/$uid.png")
            .putFile(File(avatarImage.path));
        avatarUrl = await FirebaseStorage.instance
            .ref("avatars/$uid.png")
            .getDownloadURL();
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'アバターのアップロードに失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }

    if (_formKey.currentState!.validate()) {
      try {
        await userDocument(uid).update({
          'header': headerUrl ?? user.header,
          'avatar': avatarUrl ?? user.avatar,
          'name': _formKey.currentState!.value['name'],
          'comment': _formKey.currentState!.value['comment'],
          'introduction': _formKey.currentState!.value['introduction'],
          'favorite': _formKey.currentState!.value['favorite'],
          'playTitle': playTitle,
          'remoteDuel': _formKey.currentState!.value['remoteDuel'],
          'adress': _formKey.currentState!.value['adress'],
          'activityDay': _formKey.currentState!.value['activityDay'],
          'activityTime': _formKey.currentState!.value['activityTime'],
          'age': _formKey.currentState!.value['age'],
          'sex': _formKey.currentState!.value['sex'],
          'initialSetting': true,
        });
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'プロフィールの更新に失敗しました',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
      }
    }
  }
}

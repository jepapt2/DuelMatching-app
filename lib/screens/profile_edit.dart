import 'dart:io';

import 'package:duel_matching/input_options/adress.dart';
import 'package:duel_matching/input_options/play_title.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
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

    final ScrollController _playTitleController = ScrollController();

    return UserWhenConsumer(
      child: (user) {
        final inputPlayTitle = useState<List<String>>([]);
        useEffect(() {
          inputPlayTitle.value = user.playTitle ?? [];
        }, const []);
        return Scaffold(
          appBar: AppBar(
            title: const Text('プロフィール編集'),
            actions: [
              TextButton(
                  onPressed: () => profileUpdate(
                      FirebaseAuth.instance.currentUser!.uid,
                      user,
                      inputHeaderImage.value,
                      inputAvatarImage.value,
                      inputPlayTitle.value,
                      context),
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
                          decoration: const InputDecoration(labelText: '名前'),
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: '名前を入力してください'),
                            FormBuilderValidators.maxLength(context, 15,
                                errorText: '名前は15文字以下です'),
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
                                isAlwaysShown: true,
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

  Widget headerInput(
      context, ValueNotifier<XFile?> inputHeaderImage, String? initialHeader) {
    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        Navigator.pop(context);
        inputHeaderImage.value = XFile(pickedFile.path);
      }
    }

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        Navigator.pop(context);
        inputHeaderImage.value = XFile(pickedFile.path);
      }
    }

    Widget headerImageWidget() {
      if (inputHeaderImage.value != null) {
        return Image.file(
          File(inputHeaderImage.value!.path),
          width: double.infinity,
          height: 200.0,
          fit: BoxFit.cover,
        );
      } else if (initialHeader.isNotNullAndNotEmpty) {
        return Image.network(
          initialHeader!,
          width: double.infinity,
          height: 200.0,
          fit: BoxFit.cover,
        );
      } else {
        return Container(
          color: Colors.black54,
          width: double.infinity,
          height: 200.0,
        );
      }
    }

    imageShowDialog() {
      return showDialog(
          context: context,
          builder: (childContext) {
            return SimpleDialog(
              children: [
                SimpleDialogOption(
                  child: const Text('ギャラリーから選ぶ'),
                  onPressed: () => getImageFromGallery(),
                ),
                SimpleDialogOption(
                  child: const Text('カメラから選ぶ'),
                  onPressed: () => getImageFromCamera(),
                )
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () => imageShowDialog(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.darken),
            child: headerImageWidget(),
          ),
          const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }

  Widget avatarInput(
      context, ValueNotifier<XFile?> inputAvatarImage, String? initialAvatar) {
    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        Navigator.pop(context);
        inputAvatarImage.value = XFile(pickedFile.path);
      }
    }

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        Navigator.pop(context);
        inputAvatarImage.value = XFile(pickedFile.path);
      }
    }

    ImageProvider<Object> avatarImageWidget() {
      if (inputAvatarImage.value != null) {
        return FileImage(File(inputAvatarImage.value!.path));
      } else if (initialAvatar.isNotNullAndNotEmpty) {
        return NetworkImage(initialAvatar!);
      } else {
        return const AssetImage('assets/images/initial_avatar.png');
      }
    }

    imageShowDialog() {
      return showDialog(
          context: context,
          builder: (childContext) {
            return SimpleDialog(
              children: [
                SimpleDialogOption(
                  child: const Text('ギャラリーから選ぶ'),
                  onPressed: () => getImageFromGallery(),
                ),
                SimpleDialogOption(
                  child: const Text('カメラから選ぶ'),
                  onPressed: () => getImageFromCamera(),
                )
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () => imageShowDialog(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            backgroundImage: avatarImageWidget(),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }

  playTitleOnDeleted(List<String> playTitle, String removeTitle) {
    List<String> removedTitle = [...playTitle];
    removedTitle.remove(removeTitle);
    playTitle = [...removedTitle];
  }

  profileUpdate(String uid, Profile user, XFile? headerImage,
      XFile? avatarImage, List<String> playTitle, BuildContext context) async {
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
          'sex': _formKey.currentState!.value['sex']
        });
        GoRouter.of(context).pop();
        GoRouter.of(context).push('/profile');
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

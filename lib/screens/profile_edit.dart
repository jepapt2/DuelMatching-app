import 'dart:io';

import 'package:duel_matching/viewmodel/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duel_matching/extension/string.dart';

class ProfileEditScreen extends HookConsumerWidget {
  ProfileEditScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile =
        ref.watch(userProfileProvider(FirebaseAuth.instance.currentUser!.uid));
    final profile = userProfile.profile;

    final inputHeaderImage = useState<XFile?>(null);
    final inputAvatarImage = useState<XFile?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール編集'),
        actions: [
          TextButton(
              onPressed: () {
                _formKey.currentState!.save();
                print(_formKey.currentState!.value['icon']);
              },
              child: const Text('保存'))
        ],
      ),
      body: profile!.when(
          data: (user) {
            return Container(
              child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            SizedBox(
                              height: 250,
                            ),
                            headerInput(context, inputHeaderImage, user.header),
                            Positioned(
                                bottom: 0,
                                child: avatarInput(
                                    context, inputAvatarImage, user.avatar)),
                          ]),
                      FormBuilderDateTimePicker(
                        name: 'aa',
                        locale: Locale('ja'),
                      ),
                      FormBuilderTextField(
                        name: 'name',
                        initialValue: user.avatar,
                      )
                    ],
                  )),
            );
          },
          error: (error, stack) => const Text('エラー'),
          loading: () => const CircularProgressIndicator()),
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
                  child: Text('ギャラリーから選ぶ'),
                  onPressed: () => getImageFromGallery(),
                ),
                SimpleDialogOption(
                  child: Text('カメラから選ぶ'),
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
        return AssetImage('assets/images/initial_avatar.png');
      }
    }

    imageShowDialog() {
      return showDialog(
          context: context,
          builder: (childContext) {
            return SimpleDialog(
              children: [
                SimpleDialogOption(
                  child: Text('ギャラリーから選ぶ'),
                  onPressed: () => getImageFromGallery(),
                ),
                SimpleDialogOption(
                  child: Text('カメラから選ぶ'),
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
}

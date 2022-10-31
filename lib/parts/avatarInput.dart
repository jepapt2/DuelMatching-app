import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duel_matching/extension/string.dart';

Widget avatarInput(
    context, ValueNotifier<XFile?> inputAvatarImage, String? initialAvatar) {
  final picker = ImagePicker();

  Future getImageFromCamera(childContext) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 90);

    if (pickedFile != null) {
      Navigator.pop(childContext);
      inputAvatarImage.value = XFile(pickedFile.path);
    }
  }

  Future getImageFromGallery(childContext) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 90);

    if (pickedFile != null) {
      Navigator.pop(childContext);
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
                onPressed: () => getImageFromGallery(childContext),
              ),
              SimpleDialogOption(
                child: const Text('カメラから選ぶ'),
                onPressed: () => getImageFromCamera(childContext),
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

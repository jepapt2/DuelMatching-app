import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duel_matching/extension/string.dart';

Widget headerInput(
    context, ValueNotifier<XFile?> inputHeaderImage, String? initialHeader) {
  final picker = ImagePicker();
  Future getImageFromCamera(childContext) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 400,
        maxWidth: 1200,
        imageQuality: 90);

    if (pickedFile != null) {
      Navigator.pop(childContext);
      inputHeaderImage.value = XFile(pickedFile.path);
    }
  }

  Future getImageFromGallery(childContext) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 400,
        maxWidth: 1200,
        imageQuality: 90);

    if (pickedFile != null) {
      Navigator.pop(childContext);
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
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
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

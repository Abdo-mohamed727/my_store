import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick {
  const ImagePick._();

  static const ImagePick _instance = ImagePick._();

  factory ImagePick() {
    return _instance;
  }

  Future<XFile?> pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return image;
      }
      return null;
    } on Exception catch (e) {
      debugPrint('Error picking image: ${e.toString()}');
    }
  }
}

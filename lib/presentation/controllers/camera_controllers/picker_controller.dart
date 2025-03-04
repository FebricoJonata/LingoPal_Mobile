import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final RxString imagePath = ''.obs;
  final RxString imageName = ''.obs;
  final RxString imageUrl = ''.obs;
  void setImageFile(String? path) {
    imagePath.value = path ?? "";
  }

  void setImageName(String? path) {
    imageName.value = path ?? "";
  }

  void setUrl(String? path) {
    imageUrl.value = path ?? "";
  }
}

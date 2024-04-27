import 'package:flutter/material.dart' hide MaterialPage;
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/chatbot_page.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/dictionary_page.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/home_page.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/material_page.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/profile_page.dart';

class BaseController extends GetxController {
  late PageController pageController;
  final List<Widget> pages = [HomePage(), DictionaryPage(), ChatbotPage(), MaterialPage(), ProfilePage()];
  RxInt currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/view/landing_page/widgets/page_view/page_1.dart';
import 'package:lingo_pal_mobile/presentation/view/landing_page/widgets/page_view/page_2.dart';
import 'package:lingo_pal_mobile/presentation/view/landing_page/widgets/page_view/page_3.dart';

class PageViewController extends GetxController {
  late PageController pageController;
  final List<Widget> pages = [const Page1(), const Page2(), const Page3()];
  RxInt currentPageIndex = 0.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    // _startAutoSlide();
  }

  @override
  void onClose() {
    _timer.cancel();
    pageController.dispose();
    super.onClose();
  }

  // void _startAutoSlide() {
  //   _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
  //     if (currentPageIndex.value < pages.length - 1) {
  //       currentPageIndex.value++;
  //     } else {
  //       currentPageIndex.value = 0;
  //     }
  //     pageController.animateToPage(
  //       currentPageIndex.value,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }
}

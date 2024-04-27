import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/widgets/pageview/regis_1.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/widgets/pageview/regis_2.dart';

class PageViewRegisController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = [Regis1(), Regis2()];
  RxInt currentPageIndex = 0.obs;
  RxDouble radius1 = 40.0.h.obs;
  RxDouble radius2 = 30.0.h.obs;
  Rx<Color> colorMarker = MyColors.primaryGreen.obs;
  Rx<Color> colorMarker2 = MyColors.secondaryGreen.obs;
  Rx<Color> colorLine1 = MyColors.secondaryGreen.obs;
  Rx<Color> colorLine2 = MyColors.secondaryGreen.obs;
  onChangePage1() {
    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    if (currentPageIndex == 0) {
      print(currentPageIndex);
      radius1.value = 30.h;
      radius2.value = 40.h;
      colorMarker.value = MyColors.primaryGreen;
      colorMarker2.value = MyColors.primaryGreen;
      colorLine1.value = MyColors.primaryGreen;
    } else {
      radius1.value = 40.h;
      // radius2.value = 40.h;
    }
    update();
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _HomePageState();
}

class _HomePageState extends State<BasePage> {
  // int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var controllerPage = Get.find<BaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryYellow,
      bottomNavigationBar: Container(
        width: 1179.w,
        height: 2556.h,
        child: Column(
          children: [
            Container(
                width: 1179.w,
                height: 2350.h,
                child: GetBuilder<BaseController>(
                  builder: (controller) {
                    return PageView(
                      controller: controller.pageController,
                      onPageChanged: (int index) {
                        controller.currentPageIndex.value = index;
                      },
                      children: controller.pages,
                    );
                  },
                )),
            Flexible(
              child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                color: MyColors.white,
                backgroundColor: MyColors.primaryYellow,
                items: const <Widget>[
                  Icon(Icons.home, color: MyColors.primaryGreen),
                  Icon(Icons.menu_book_rounded, color: MyColors.primaryGreen),
                  Icon(Icons.chat_bubble, color: MyColors.primaryGreen),
                  Icon(Icons.video_collection, color: MyColors.primaryGreen),
                  Icon(Icons.person, color: MyColors.primaryGreen),
                ],
                onTap: (index) {
                  setState(() {
                    switch (index) {
                      case 0:
                        controllerPage.pageController
                            .animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      case 1:
                        controllerPage.pageController
                            .animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      case 2:
                        controllerPage.pageController
                            .animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      case 3:
                        controllerPage.pageController
                            .animateToPage(3, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      case 4:
                        controllerPage.pageController
                            .animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      default:
                        break;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/pages/landing_page/controller/page_view_controller.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var controller = Get.find<PageViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryYellow,
      body: SizedBox(
        width: 1179.w,
        height: 2556.h,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 1179.w,
                height: 2556.h,
                child: Column(
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetConstraints.bgIntroTop,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 1179.w,
                          height: 1500.h,
                          child: GetBuilder<PageViewController>(builder: (controller) {
                            return PageView(
                              controller: controller.pageController,
                              onPageChanged: (int index) {
                                controller.currentPageIndex.value = index;
                              },
                              children: controller.pages,
                            );
                          }),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          AssetConstraints.bgIntroBot,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 1179.w,
              height: 2556.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(90.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 200.w,
                        height: 100.h,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(RouteName.loginPage);
                              },
                              child: Text("Skip", style: TextStyle(color: MyColors.white, fontSize: 50.sp))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 900.w,
                    height: 1200.h,
                    child: GetBuilder<PageViewController>(
                      builder: (controller) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                controller.pages.length,
                                (index) => Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: InkWell(onTap: () {
                                      controller.currentPageIndex.value = index;
                                      controller.pageController.animateToPage(index,
                                          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                                    }, child: Obx(() {
                                      return Container(
                                        width: 40.h,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: controller.currentPageIndex == index
                                              ? MyColors.primaryGreen
                                              : MyColors.secondaryGreen,
                                        ),
                                      );
                                    }))),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

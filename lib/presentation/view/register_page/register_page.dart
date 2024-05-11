// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/widgets/pageview/regis_1.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  // var pageController = Get.find<PageViewRegisController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryYellow,
      body: SizedBox(
        width: 1179.w,
        height: 2556.h,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgAppLogo),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                width: 1179.w,
                height: 1900.h,
                child: Column(
                  children: [
                    SizedBox(
                      width: 1179.w,
                      height: 150.h,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 50.h,
                              backgroundColor: MyColors.secondaryGreen,
                              child: Icon(
                                Icons.arrow_back,
                                color: MyColors.white,
                                size: 50.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Flexible(
                      child: SizedBox(width: 1179.w, height: 1500.h, child: Regis1()),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

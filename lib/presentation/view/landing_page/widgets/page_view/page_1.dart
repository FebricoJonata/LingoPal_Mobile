import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900.w,
      height: 1200.h,
      color: MyColors.secondaryYellow,
      child: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 1200.w,
            height: 700.h,
            child: Image.asset(
              AssetConstraints.page1,
              width: 300.w,
            ),
          ),
        ),
        Container(
          height: 150.h,
        ),
        Flexible(
          child: SizedBox(
              width: 1200.w,
              height: 500.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Welcome to LingoPal!!"),
                  const Text("Start your English learning journey here."),
                  SizedBox(
                    height: 165.h,
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

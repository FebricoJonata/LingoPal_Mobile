import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
              AssetConstraints.page2,
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
                  const Text("Enhance your English language proficiency"),
                  const Text("with the help of materials and AI chatbot."),
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

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
      width: 1179.w,
      height: 2556.h,
      color: MyColors.secondaryYellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetConstraints.page2,
            height: 500.h,
          ),
          Container(
            height: 150.h,
          ),
          const Text("Enhance your English language proficiency "),
          const Text("with the help of materials and AI chatbot."),
        ],
      ),
    );
  }
}

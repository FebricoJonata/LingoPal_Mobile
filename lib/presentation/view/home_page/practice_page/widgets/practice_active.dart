import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class ActivePractice extends StatelessWidget {
  const ActivePractice({super.key, required this.id, required this.code});

  final int id;
  final String code;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.quiz);
      },
      child: SizedBox(
        height: 360.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 200.w,
            height: 200.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: MyColors.secondaryYellow,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 5, color: MyColors.secondaryGreen)),
            child: Container(
                width: 150.w,
                height: 150.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.secondaryGreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  code,
                  style: TextStyle(color: Colors.white, fontSize: 100.sp, fontWeight: FontWeight.bold),
                )),
          ),
          const Text(
            "MULAI",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}

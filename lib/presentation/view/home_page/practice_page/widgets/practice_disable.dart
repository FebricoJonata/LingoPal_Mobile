import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class DisablePractice extends StatelessWidget {
  const DisablePractice({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 400.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200.w,
            height: 200.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MyColors.primaryYellow,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.lock_rounded, size: 100.sp, color: MyColors.secondaryYellow,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star_border, size: 70.w, color: MyColors.primaryYellow,),
              Icon(Icons.star_border, size: 70.w, color: MyColors.primaryYellow,),
              Icon(Icons.star_border, size: 70.w, color: MyColors.primaryYellow,)
            ],
          )
        ]),
    );
  }
}
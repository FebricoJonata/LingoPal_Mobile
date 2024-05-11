import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class PracticeDone extends StatelessWidget {
  const PracticeDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 400.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 180.w,
            height: 180.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MyColors.primaryGreen,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text("1", style: TextStyle(color: Colors.white, fontSize: 100.sp, fontWeight: FontWeight.bold),)),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.star_rounded, size: 70.sp, color: MyColors.primaryGreen,),
                Icon(Icons.star_border, size: 70.sp, color: MyColors.primaryGreen,),
                Icon(Icons.star_border, size: 70.sp, color: MyColors.primaryGreen,)
              ],
            ),
          )
        ]),
    );
  }
}
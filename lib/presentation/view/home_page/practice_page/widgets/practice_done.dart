import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';

class PracticeDone extends StatelessWidget {
  const PracticeDone({super.key, required this.practiceDone, required this.onTap});

  final PracticeProgress practiceDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 180.w,
        height: 360.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 180.w,
              height: 180.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.primaryGreen,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                practiceDone.practice!.practiceCode.toString(),
                style: TextStyle(color: Colors.white, fontSize: 100.sp, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i <= 3; i++)
                  if (i <= practiceDone.progressPoin!)
                    Icon(
                      Icons.star_rounded,
                      size: 70.sp,
                      color: MyColors.primaryGreen,
                    )
                  else
                    Icon(
                      Icons.star_border,
                      size: 70.sp,
                      color: MyColors.primaryGreen,
                    )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

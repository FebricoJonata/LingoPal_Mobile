import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_active.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_disable.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_done.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/home_appbar.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 250.h),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 50.w,
              mainAxisSpacing: 100.h,
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: (1/1.2),
              children: [
                for(int i=1; i<=12; i++)
                  if(i==6)
                    ActivePractice()
                  else if(i<6)
                    PracticeDone()
                  else
                    DisablePractice()
              ],
            ),
          ],
        ),
      )
    );
  }
}
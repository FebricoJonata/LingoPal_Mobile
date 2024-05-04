import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_disabled.card.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            // app bar
            const CustomAppBar(),
            SizedBox(height: 150.h,),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(20, 50.h, 20, 250.h),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CourseDisabledCard();
                }, 
                separatorBuilder: (BuildContext context, int index) { 
                  return SizedBox(height: 50.h,); 
                },
              ),
            )
            // content
          ]
        ),
      ),
    );
  }
}

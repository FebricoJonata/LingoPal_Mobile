import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';

class CourseDisabledCard extends StatelessWidget {
  const CourseDisabledCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.sp)), color: Colors.white),
        padding: EdgeInsets.all(36.sp),
        height: 300.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(course.courseName!, style: TextStyle(fontSize: 44.sp, fontWeight: FontWeight.bold),),),
                      SizedBox(width: 80.w,),
                      Row(
                        children: [Icon(Icons.star, size: 50.w,), SizedBox(width: 80.w, child: Text("0", style: TextStyle(fontSize: 40.sp),))],
                      )
                    ],
                  ),
                ),
                Text(course.category!.courseCategoryName!, style: TextStyle(fontSize: 36.sp),),
                Text(course.courseDescription!, style: TextStyle(fontSize: 32.sp), overflow: TextOverflow.ellipsis,)
              ],),
            ),
            SizedBox(
              width: 165.w,
            ),
            Icon(
              Icons.lock_rounded,
              size: 150.w,
              color: MyColors.secondaryYellow,
            )
          ],
        ),
      ),
    );
  }
}

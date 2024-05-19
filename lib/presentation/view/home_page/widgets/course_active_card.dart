import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class CourseActiveCard extends StatelessWidget {
  const CourseActiveCard({super.key, required this.course, required this.userProgressPoin});

  final Course course; final int userProgressPoin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.sp)), color: Colors.white),
        // color: Colors.white,
        padding: EdgeInsets.all(36.sp),
        height: 300.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          course.courseName!,
                          style: TextStyle(fontSize: 50.sp),
                        ),
                        SizedBox(
                          width: 200.w,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 50.w,
                            ),
                            Text(
                              userProgressPoin.toString(),
                              style: TextStyle(fontSize: 40.sp),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    course.category!.courseCategoryName!, // dari BE course
                    style: TextStyle(fontSize: 40.sp),
                  ),
                  Text(
                    course.courseDescription!,
                    style: TextStyle(fontSize: 32.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            PrimaryBtn(
              btnText: "Lihat",
              width: 300.w,
              height: 120.h,
              onClick: () {
                print("Go");
                Get.toNamed("/practice", arguments: {'course_id': course.courseId!});
              },
            )
          ],
        ),
      ),
    );
  }
}

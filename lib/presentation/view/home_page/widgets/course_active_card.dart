import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class CourseActiveCard extends StatelessWidget {
  const CourseActiveCard({super.key});

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
                          "A1 - Basic",
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
                              "11/45",
                              style: TextStyle(fontSize: 40.sp),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Pilihan Ganda - Level 6",
                    style: TextStyle(fontSize: 40.sp),
                  ),
                  Text(
                    "Deskripsi course",
                    style: TextStyle(fontSize: 32.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            PrimaryBtn(
              btnText: "Go",
              width: 350.w,
              height: 120.h,
              onClick: () {
                print("Go");
              },
            )
          ],
        ),
      ),
    );
  }
}

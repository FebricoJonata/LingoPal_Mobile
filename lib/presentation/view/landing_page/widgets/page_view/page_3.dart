import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900.w,
      height: 1200.h,
      color: MyColors.secondaryYellow,
      child: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 1200.w,
            height: 700.h,
            child: Image.asset(
              AssetConstraints.page3,
              width: 300.w,
            ),
          ),
        ),
        Container(
          height: 150.h,
        ),
        Flexible(
          child: SizedBox(
              width: 1200.w,
              height: 500.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Explore words that can be helpful in "),
                  const Text("careers, literature, entertainment, research,"),
                  SizedBox(
                    height: 50.h,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 400.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                          ),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp))),
                          backgroundColor: WidgetStateProperty.all<Color>(MyColors.primaryGreen),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteName.loginPage);
                        },
                        child: Text(
                          "Start Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 30.sp),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}

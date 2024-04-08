import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900.w,
      height: 1200.h,
      color: MyColors.secondaryYellow,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          AssetConstraints.page3,
          height: 500.h,
        ),
        Container(
          height: 150.h,
        ),
        const Text("Explore words that can be helpful in "),
        const Text("careers, literature, entertainment, research,"),
        // SizedBox(
        //   height: 70.h,
        // ),
        // SizedBox(
        //   width: 400.w,
        //   child: ElevatedButton(
        //     style: ButtonStyle(
        //       padding: MaterialStateProperty.all<EdgeInsets>(
        //         const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
        //       ),
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp))),
        //       backgroundColor: MaterialStateProperty.all<Color>(MyColors.primaryGreen),
        //     ),
        //     onPressed: () {},
        //     child: Text(
        //       "Lanjutkan",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 30.sp),
        //     ),
        //   ),
        // )
      ]),
    );
  }
}

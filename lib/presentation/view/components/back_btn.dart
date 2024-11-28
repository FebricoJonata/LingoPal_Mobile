import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key, this.ontap});
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      // Get.back();

      child: CircleAvatar(
        radius: 50.h,
        backgroundColor: MyColors.secondaryGreen,
        child: Icon(
          Icons.arrow_back,
          color: MyColors.white,
          size: 50.h,
        ),
      ),
    );
  }
}

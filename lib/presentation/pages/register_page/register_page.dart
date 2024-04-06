import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/Components/text_field_reusable.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReuseTextField(
            linesMax: 1,
            linesMin: 1,
            color: MyColors.primaryGreen,
            fontSize: 17.sp,
            radius: 25.sp,
            width: 300.w,
            iconTxt: Icons.person,
            iconSize: 30.sp,
            labelTxt: "Name",
            maxHeight: 150.h));
  }
}

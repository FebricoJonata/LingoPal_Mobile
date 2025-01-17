import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';

class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn({
    super.key,
    required this.btnText,
    required this.width,
    required this.height,
    this.onClick,
    this.fontSize,
    this.isLoading,
  });

  final double? fontSize;
  final String btnText;
  final double width;
  final double height;
  final Function()? onClick;
  final bool? isLoading; // Optional isLoading

  @override
  Widget build(BuildContext context) {
    final loading = isLoading ?? false; // Default to false if isLoading is null
    return FilledButton(
      onPressed: loading ? null : onClick,
      style: FilledButton.styleFrom(
          backgroundColor: loading ? MyColors.grey : MyColors.secondaryGreen, minimumSize: Size(width, height), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp))),
      child: loading
          ? const CircularProgressIndicator(
              color: MyColors.white,
            )
          : Text(
              btnText,
              style: TextStyle(
                color: MyColors.white,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

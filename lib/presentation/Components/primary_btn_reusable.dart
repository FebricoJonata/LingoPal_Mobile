import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class PrimaryBtn extends StatelessWidget {
  
  const PrimaryBtn({
    super.key, 
    required this.btnText,
    required this.width, 
    required this.height,
    this.onClick,
  });


  final String btnText;
  final double width;
  final double height;
  final Function()? onClick;
  

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onClick,

      style: FilledButton.styleFrom(
        backgroundColor: MyColors.primaryGreen,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.sp)
        )
      ), 

      child: Text(
        btnText, 
        style: TextStyle(
          color: MyColors.white,
          // font
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          // fontFamily: "Lato"
        )
      ),
    );
  }
  
}
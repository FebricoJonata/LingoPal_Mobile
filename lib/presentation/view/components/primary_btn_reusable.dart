// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

// class PrimaryBtn extends StatelessWidget {
//   const PrimaryBtn({
//     super.key,
//     required this.btnText,
//     required this.width,
//     required this.height,
//     this.onClick,
//   });

//   final String btnText;
//   final double width;
//   final double height;
//   final Function()? onClick;

//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       onPressed: onClick,
//       style: FilledButton.styleFrom(
//           foregroundColor: MyColors.primaryGreen, backgroundColor: MyColors.primaryGreen, minimumSize: Size(width, height), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp))),
//       child: Text(btnText,
//           style: const TextStyle(
//             color: MyColors.white,
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//           )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.btnText,
    required this.width,
    required this.height,
    this.onClick,
    this.isLoading,
  });

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
        foregroundColor: MyColors.primaryGreen,
        backgroundColor: loading ? MyColors.grey : MyColors.primaryGreen,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp)),
      ),
      child: loading
          ? const CircularProgressIndicator(
              color: MyColors.white,
            )
          : Text(
              btnText,
              style: const TextStyle(
                color: MyColors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

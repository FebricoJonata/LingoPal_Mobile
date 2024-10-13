import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class AlertGood extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  final String imagePath;
  final String score;

  const AlertGood({
    Key? key,
    required this.title,
    required this.message,
    required this.onClose,
    required this.imagePath,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      width: 500.w,
      height: 750.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: MyColors.secondaryYellow,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: MyColors.grey,
            offset: Offset(0, 4),
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 900.w,
            height: 300.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(imagePath),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        "Nilai",
                        style: TextStyle(color: MyColors.secondaryGreen, fontSize: 80.sp),
                      ),
                      Text(
                        score,
                        style: TextStyle(color: MyColors.primaryGreen, fontSize: 100.sp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(MyColors.primaryGreen),
              ),
              onPressed: onClose,
              child: const Text(
                'Close',
                style: TextStyle(
                  color: MyColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

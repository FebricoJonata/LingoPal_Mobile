import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
// import 'package:lingo_pal_mobile/presentation/view/recorder/recorder_main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: SizedBox(
        width: 1179.w,
        height: 2700.h,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            SizedBox(
              width: 1179.w,
              height: 1300.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetConstraints.robotQuiz),
                  Text(
                    "Its a sunny day",
                    style: TextStyle(color: MyColors.primaryGreen, fontSize: 100.sp),
                  )
                ],
              ),
            ),
            // Flexible(child: Container(color: Colors.blue, child: Record()))
          ],
        ),
      ),
    );
  }
}

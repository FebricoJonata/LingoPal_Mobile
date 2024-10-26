// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';
import 'package:lingo_pal_mobile/presentation/view/quiz_page/voice_assesment/recorder.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var controllerQuiz = Get.find<PronounQuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: Obx(() => SizedBox(
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
                      controllerQuiz.isRecord == 0
                          ? Image.asset(AssetConstraints.robotQuiz)
                          : const CircularProgressIndicator(
                              color: MyColors.primaryGreen,
                            ),
                      Text(
                        "Its a sunny day",
                        style: TextStyle(color: MyColors.primaryGreen, fontSize: 100.sp),
                      )
                    ],
                  ),
                ),
                Flexible(child: Container(width: 1179.w, color: MyColors.primaryYellow, child: const Center(child: Recorder())))
              ],
            ),
          )),
    );
  }
}

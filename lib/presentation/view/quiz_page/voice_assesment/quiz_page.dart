// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/secondary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/quiz_page/voice_assesment/recorder.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert_score.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  var controllerQuizQuestion = Get.find<MultipleChoiceController>();
  var controllerQuiz = Get.find<PronounQuizController>();
  RxBool quizDone = false.obs;
  RxInt currentQuestion = 0.obs;
  final RxInt score = 0.obs;

  final RxInt stars = 0.obs;

  var finalScore;
  void showScoreDialog(BuildContext context, double score) {
    if (score < 65) {
      Get.dialog(
        AlertGood(
          title: "Try Again",
          message: "Haha",
          onClose: () {
            Get.back();
          },
          imagePath: AssetConstraints.robotSad,
          score: "$score",
        ),
      );
    } else {
      Get.dialog(
        AlertGood(
          title: "Good Job",
          message: "Haha",
          onClose: () {
            Get.back();
            var scores = controllerQuiz.score.value += score;
            finalScore = scores / 5;
            if (currentQuestion.value < controllerQuizQuestion.mutlipleData.value!.data!.length - 1) {
              currentQuestion.value += 1;
            } else {
              quizDone.value = true;
              finalScore = (scores / 5).toInt();

              stars.value = 0;
              if (finalScore == 100) {
                stars.value = 3;
              } else if (finalScore >= 60) {
                stars.value = 2;
              } else if (finalScore >= 30) {
                stars.value = 1;
              } else {
                stars.value = 0;
              }
            }
          },
          imagePath: AssetConstraints.robotQuiz,
          score: "$score",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: Obx(() {
        if (quizDone.value == false) {
          if (controllerQuiz.speechText.value != null && controllerQuiz.flag.value == 1) {
            final score = controllerQuiz.speechText.value!.body?.pronunciationScores?.pronunciationScore ?? 0;
            controllerQuiz.flag.value = 0; // Reset flag untuk menghindari dialog berulang
            Future.microtask(() => showScoreDialog(context, score));
          }
          return SizedBox(
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
                        controllerQuizQuestion.mutlipleData.value?.data?[currentQuestion.value].question.toString() ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: MyColors.primaryGreen, fontSize: 100.sp),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 1179.w,
                    color: MyColors.primaryYellow,
                    child: Center(
                        child: Recorder(
                      referenceText: controllerQuizQuestion.mutlipleData.value?.data?[currentQuestion.value].question.toString() ?? "",
                    )),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            width: 1179.w,
            height: 2700.h,
            child: Column(
              children: [
                buildScoreContent(),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.primaryYellow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70.sp),
                        topRight: Radius.circular(70.sp),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrimaryBtn(
                            btnText: "Coba Lagi",
                            width: 700.w,
                            height: 150.h,
                            onClick: () {
                              currentQuestion.value = 0;
                              score.value = 0;
                              quizDone.value = false;
                              stars.value = 0;
                            },
                          ),
                          SecondaryBtn(
                            btnText: "Balik ke halaman level",
                            width: 700.w,
                            height: 150.h,
                            onClick: () async {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget buildScoreContent() {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Anda mendapat skor",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40.sp),
          ),
          Text(
            "$finalScore/100",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 140.sp),
          ),
          Image.asset(AssetConstraints.robotHappy),
          buildStarRating(stars.value),
        ],
      ),
    );
  }

  Widget buildStarRating(int stars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: MyColors.primaryGreen,
          size: 80.sp,
        );
      }),
    );
  }
}

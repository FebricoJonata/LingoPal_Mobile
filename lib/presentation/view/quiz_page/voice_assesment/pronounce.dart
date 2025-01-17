// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/course_update.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/secondary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/quiz_page/voice_assesment/recorder.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert_score.dart';

import '../../../controllers/home_controllers/practice_course_API_controller.dart';
import '../../../controllers/quiz_controller/practice_update.dart';

class PronouncePage extends StatelessWidget {
  PronouncePage({super.key});

  var controllerQuizQuestion = Get.find<QuestionsController>();
  var practiceUpdateController = Get.find<PracticeUpdateController>();
  var controllerProgress = Get.find<PracticeCourseController>();
  var controllerQuiz = Get.find<PronounQuizController>();
  var controllerUpdateCourse = Get.find<CourseUpdateController>();
  RxBool quizDone = false.obs;
  RxInt currentQuestion = 0.obs;
  // final RxInt score = 0.obs;

  final RxInt stars = 0.obs;

  var finalScore;

  int lengthofUserPractice = Get.arguments['progressLength'];

  RxBool btnLoad = false.obs;

  void showScoreDialog(BuildContext context, double score) {
    // if (score < 65) {
    //   Get.dialog(
    //     AlertGood(
    //       title: "Try Again",
    //       message: "Haha",
    //       onClose: () {
    //         Get.back();
    //       },
    //       imagePath: AssetConstraints.robotSad,
    //       score: "$score",
    //     ),
    //   );
    // } else {
    Get.dialog(
      AlertGood(
        title: "Good Job",
        message: "",
        onClose: () {
          Get.back();
          var scores = controllerQuizQuestion.calculateScore(score);
          if (currentQuestion.value < controllerQuizQuestion.mutlipleData.value!.data!.length - 1) {
            currentQuestion.value += 1;
          } else {
            quizDone.value = true;
            finalScore = controllerQuizQuestion.calculateFinalScorePronoun(scores); // Hitung finalScore
            stars.value = controllerQuizQuestion.starsValue(finalScore); // Gunakan nilai finalScore
          }
        },
        // onClose: () {
        //   Get.back();
        //   var scores = controllerQuiz.score.value += score;
        //   finalScore = scores / 5;
        //   if (currentQuestion.value < controllerQuizQuestion.mutlipleData.value!.data!.length - 1) {
        //     currentQuestion.value += 1;
        //   } else {
        //     quizDone.value = true;
        //     finalScore = (scores / 5).toInt();

        //     // Menggunakan fungsi calculateStars
        //     stars.value = starsValue(finalScore);
        //   }
        // },
        imagePath: AssetConstraints.robotQuiz,
        score: "$score",
      ),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: PopScope(
        canPop: false,
        child: Obx(() {
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
                  Image.asset(AssetConstraints.bgQuiz),
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
                  Image.asset(AssetConstraints.bgQuiz),
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
                        child: SizedBox(
                          width: 900.w,
                          height: 400.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(() {
                                return PrimaryBtn(
                                  btnText: "try_again".tr,
                                  width: 700.w,
                                  height: 150.h,
                                  onClick: btnLoad.value
                                      ? null
                                      : () {
                                          currentQuestion.value = 0;
                                          controllerQuizQuestion.score.value = 0;
                                          quizDone.value = false;
                                          stars.value = 0;
                                          print("Practice ID Pronounce: ${controllerProgress.practiceId.value}");
                                          controllerQuizQuestion.fetchQuestions(controllerProgress.practiceId.value);
                                        },
                                );
                              }),
                              Obx(() {
                                return SecondaryBtn(
                                  isLoading: (practiceUpdateController.isLoading.value || controllerUpdateCourse.isLoading.value || controllerProgress.isLoading.value),
                                  btnText: "back_to_levels".tr,
                                  width: 700.w,
                                  height: 150.h,
                                  onClick: () async {
                                    btnLoad.value = true;
                                    bool practiceFound = false;
                                    int prevStars = 0;
                                    int userPracticeProgress = 0;
                                    for (var progress in controllerProgress.practiceProgress.value?.body ?? []) {
                                      if (controllerProgress.practiceId.value == progress.practiceId) {
                                        practiceFound = true;
                                        controllerProgress.indexPractice.value = progress.progressPracticeId;
                                        userPracticeProgress = progress.progressPracticeId;
                                        break;
                                      } else {
                                        practiceFound = false;
                                      }
                                    }
                                    if (stars.value >= 1) {
                                      if (practiceFound == true) {
                                        if (stars.value > prevStars) {
                                          await practiceUpdateController.updatePractice(
                                              userPracticeProgress, controllerProgress.practiceId.value, stars.value, true, true, controllerProgress.courseId.value);
                                        }

                                        if (controllerUpdateCourse.lstIndex.value == true || lengthofUserPractice == 5) {
                                          await controllerUpdateCourse.updateCourse(controllerProgress.courseId.value);
                                        }
                                      } else {
                                        await practiceUpdateController.updatePractice(0, controllerProgress.practiceId.value, stars.value, true, true, controllerProgress.courseId.value);
                                        if (controllerUpdateCourse.lstIndex.value == true) {
                                          controllerUpdateCourse.updateCourse(controllerProgress.courseId.value);
                                        }
                                      }
                                    }
                                    controllerQuizQuestion.score.value = 0; // reset score
                                    await controllerProgress.getPractices(controllerProgress.courseId.value);
                                    await controllerProgress.getUserPractices();
                                    controllerUpdateCourse.lstIndex.value = false;
                                    btnLoad.value = false;
                                    Get.back();
                                  },
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget buildScoreContent() {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "score_eval".tr,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40.sp),
          ),
          Text(
            "$finalScore/100",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 140.sp),
          ),
          Image.asset(AssetConstraints.robotHappy),
          buildStarRating(controllerQuizQuestion.starsValue(finalScore)),
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

// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/course_update.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/practice_update.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/secondary_btn_reusable.dart';

class MutlipleChoice extends StatelessWidget {
  MutlipleChoice({super.key});

  final QuestionsController controllerMultiple = Get.find<QuestionsController>();
  final PracticeUpdateController practiceUpdateController = Get.find<PracticeUpdateController>();
  var controllerProgress = Get.find<PracticeCourseController>();
  var controllerUpdateCourse = Get.find<CourseUpdateController>();

  final RxInt currentIndex = 0.obs;

  final RxInt score = 0.obs;

  final RxBool flag = false.obs;

  final RxInt stars = 0.obs;

  var finalScore = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: PopScope(
        canPop: false,
        child: Obx(() => SizedBox(
              width: 1179.w,
              height: 2700.h,
              child: flag.value == false
                  ? Column(
                      children: [
                        Image.asset(AssetConstraints.bgQuiz),
                        buildQuizContent(),
                        buildAnswerChoices(),
                      ],
                    )
                  : Column(
                      children: [Image.asset(AssetConstraints.bgQuiz), buildScoreContent(), buldChoiceScore()],
                    ),
            )),
      ),
    );
  }

  Widget buildQuizContent() {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetConstraints.robotQuiz),
          SizedBox(height: 40.h),
          Obx(() {
            final question = controllerMultiple.mutlipleData.value?.data?[currentIndex.value].question;
            return SizedBox(
              width: 900.w,
              child: Text(
                question?.toString() ?? "No Data",
                style: TextStyle(
                  color: MyColors.primaryGreen,
                  fontSize: 75.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildAnswerChoices() {
    return Flexible(
      flex: 1,
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
            width: 1300.w,
            height: 400.h,
            child: Obx(() {
              final choices = controllerMultiple.mutlipleData.value?.data?[currentIndex.value].choices;
              if (choices == null || choices.isEmpty) {
                return const Text("No Choices Available");
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 1000.w,
                    height: 175.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildChoiceButton(choices[0], 0),
                        _buildChoiceButton(choices[1], 1),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1000.w,
                    height: 175.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildChoiceButton(choices[2], 2),
                        _buildChoiceButton(choices[3], 3),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buldChoiceScore() {
    return Flexible(
      flex: 1,
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
                PrimaryBtn(
                  btnText: "try_again".tr,
                  width: 700.w,
                  height: 150.h,
                  onClick: () {
                    currentIndex.value = 0;
                    score.value = 0;
                    flag.value = false;
                    stars.value = 0;
                    controllerMultiple.fetchQuestions(controllerProgress.practiceId.value);
                  },
                ),
                SecondaryBtn(
                  btnText: "back_to_levels".tr,
                  width: 700.w,
                  height: 150.h,
                  onClick: () async {
                    bool practiceFound = false;
                    int prevStars = 0;

                    for (var progress in controllerProgress.practiceProgress.value?.body ?? []) {
                      if (controllerProgress.practiceId.value == progress.practiceId) {
                        practiceFound = true;
                        prevStars = progress.progressPoin;
                        print("Previous points: ${progress.progressPoin}");

                        break;
                      } else {
                        practiceFound = false;
                      }
                    }
                    if (stars.value >= 1) {
                      if (practiceFound == true && prevStars!=0) {
                        if (controllerUpdateCourse.lstIndex.value == true) {
                          controllerUpdateCourse.updateCourse(controllerProgress.courseId.value);
                        }
                        practiceUpdateController.updatePractice(controllerProgress.practiceProgress.value?.body?[controllerProgress.indexPractice.value].progressPracticeId ?? 0,
                            controllerProgress.practiceProgress.value?.body?[controllerProgress.indexPractice.value].practiceId ?? 0, stars.value, true, true, controllerProgress.courseId.value);
                      } else {
                        if (controllerUpdateCourse.lstIndex.value == true) {
                          controllerUpdateCourse.updateCourse(controllerProgress.courseId.value);
                        }
                        practiceUpdateController.updatePractice(0, controllerProgress.practiceId.value, stars.value, true, true, controllerProgress.courseId.value);
                      }
                    }
                    await controllerProgress.getPractices(controllerProgress.courseId.value);
                    await controllerProgress.getUserPractices();
                    controllerUpdateCourse.lstIndex.value = false;
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceButton(String choiceText, int choiceIndex) {
    return PrimaryBtn(
        btnText: choiceText,
        width: 450.w,
        height: 160.h,
        fontSize: 44.sp,
        // onClick: () {
        //   // if (choiceText == controllerMultiple.mutlipleData.value?.data?[currentIndex.value].answerKey) {
        //   //   score + 1;
        //   // }
        //   // if (currentIndex.value < controllerMultiple.mutlipleData.value!.data!.length - 1) {
        //   //   currentIndex.value += 1;
        //   // } else {
        //   //   finalScore.value = ((score.value / controllerMultiple.mutlipleData.value!.data!.length) * 100).toInt();
        //   //   flag.value = true;
        //   //   stars.value = 0;
        //   //   if (finalScore == 100) {
        //   //     stars.value = 3;
        //   //   } else if (finalScore >= 60) {
        //   //     stars.value = 2;
        //   //   } else if (finalScore >= 30) {
        //   //     stars.value = 1;
        //   //   } else {
        //   //     stars.value = 0;
        //   //   }
        //   // }
        //   if (choiceText == controllerMultiple.mutlipleData.value?.data?[currentIndex.value].answerKey) {
        //     score.value += 1;
        //   }
        //   if (currentIndex.value < controllerMultiple.mutlipleData.value!.data!.length - 1) {
        //     currentIndex.value += 1;
        //   } else {
        //     finalScore.value = ((score.value / controllerMultiple.mutlipleData.value!.data!.length) * 100).toInt();
        //     stars.value = starsValue(finalScore.value);
        //     flag.value = true;
        //   }
        // },
        onClick: () {
          if (choiceText == controllerMultiple.mutlipleData.value?.data?[currentIndex.value].answerKey) {
            score.value += 1;
          }
          if (currentIndex.value < controllerMultiple.mutlipleData.value!.data!.length - 1) {
            currentIndex.value += 1;
          } else {
            final totalQuestions = controllerMultiple.mutlipleData.value!.data!.length;
            final correctAnswers = score.value;

            finalScore.value = controllerMultiple.calculateFinalScore(totalQuestions, correctAnswers);
            stars.value = starsValue(finalScore.value);
            flag.value = true;
          }
        });
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
          buildStarRating(stars.value),
        ],
      ),
    );
  }

  int starsValue(int finalScore) {
    if (finalScore == 100) {
      return 3; // Skor sempurna mendapatkan 3 bintang
    } else if (finalScore >= 60) {
      return 2; // Skor 60-99 mendapatkan 2 bintang
    } else if (finalScore >= 30) {
      return 1; // Skor 30-59 mendapatkan 1 bintang
    } else {
      return 0; // Skor di bawah 30 tidak mendapatkan bintang
    }
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

// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, unrelated_type_equality_checks, prefer_final_fields

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

  var _controllerQuizQuestion = Get.find<QuestionsController>();
  var _practiceUpdateController = Get.find<PracticeUpdateController>();
  var _controllerProgress = Get.find<PracticeCourseController>();
  var _controllerQuiz = Get.find<PronounQuizController>();
  var _controllerUpdateCourse = Get.find<CourseUpdateController>();
  RxBool _quizDone = false.obs;
  RxInt _currentQuestion = 0.obs;
  // final RxInt score = 0.obs;

  final RxInt _stars = 0.obs;

  var _finalScore;

  int lengthofUserPractice = Get.arguments['progressLength'];

  RxBool _btnLoad = false.obs;
  bool _isPronounce = true;

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
          var scores = _controllerQuizQuestion.calculateScore(score);
          if (_currentQuestion.value < _controllerQuizQuestion.mutlipleData.value!.data!.length - 1) {
            _currentQuestion.value += 1;
          } else {
            _quizDone.value = true;
            _finalScore = _controllerQuizQuestion.calculateFinalScorePronoun(scores); // Hitung finalScore
            _stars.value = _controllerQuizQuestion.starsValue(_finalScore, _isPronounce); // Gunakan nilai finalScore
          }
        },
        // onClose: () {
        //   Get.back();
        //   var scores = controllerQuiz.score.value += score;
        //   finalScore = scores / 5;
        //   if (_currentQuestion.value < controllerQuizQuestion.mutlipleData.value!.data!.length - 1) {
        //     _currentQuestion.value += 1;
        //   } else {
        //     _quizDone.value = true;
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
          if (_quizDone.value == false) {
            if (_controllerQuiz.speechText.value != null && _controllerQuiz.flag.value == 1) {
              final score = _controllerQuiz.speechText.value!.body?.pronunciationScores?.pronunciationScore ?? 0;
              _controllerQuiz.flag.value = 0; // Reset flag untuk menghindari dialog berulang
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
                        _controllerQuiz.isRecord == 0
                            ? Image.asset(AssetConstraints.robotQuiz)
                            : const CircularProgressIndicator(
                                color: MyColors.primaryGreen,
                              ),
                        Text(
                          _controllerQuizQuestion.mutlipleData.value?.data?[_currentQuestion.value].question.toString() ?? "",
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
                        referenceText: _controllerQuizQuestion.mutlipleData.value?.data?[_currentQuestion.value].question.toString() ?? "",
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
                                  onClick: _btnLoad.value
                                      ? null
                                      : () {
                                          _currentQuestion.value = 0;
                                          _controllerQuizQuestion.score.value = 0.0;
                                          _quizDone.value = false;
                                          _stars.value = 0;
                                          _controllerQuizQuestion.fetchQuestions(_controllerProgress.practiceId.value);
                                        },
                                );
                              }),
                              Obx(() {
                                return SecondaryBtn(
                                  isLoading: (_practiceUpdateController.isLoading.value || _controllerUpdateCourse.isLoading.value || _controllerProgress.isLoading.value),
                                  btnText: "back_to_levels".tr,
                                  width: 700.w,
                                  height: 150.h,
                                  onClick: () async {
                                    _btnLoad.value = true;
                                    bool practiceFound = false;
                                    int prevStars = 0;
                                    int userPracticeProgress = 0;
                                    for (var progress in _controllerProgress.practiceProgress.value?.body ?? []) {
                                      if (_controllerProgress.practiceId.value == progress.practiceId) {
                                        practiceFound = true;
                                        _controllerProgress.indexPractice.value = progress.progressPracticeId;
                                        userPracticeProgress = progress.progressPracticeId;
                                        break;
                                      } else {
                                        practiceFound = false;
                                      }
                                    }
                                    if (_stars.value >= 1) {
                                      if (practiceFound == true) {
                                        if (_stars.value > prevStars) {
                                          await _practiceUpdateController.updatePractice(
                                              userPracticeProgress, _controllerProgress.practiceId.value, _stars.value, true, true, _controllerProgress.courseId.value);
                                        }

                                        if (_controllerUpdateCourse.lstIndex.value == true || lengthofUserPractice == 5) {
                                          await _controllerUpdateCourse.updateCourse(_controllerProgress.courseId.value);
                                        }
                                      } else {
                                        await _practiceUpdateController.updatePractice(0, _controllerProgress.practiceId.value, _stars.value, true, true, _controllerProgress.courseId.value);
                                        if (_controllerUpdateCourse.lstIndex.value == true) {
                                          _controllerUpdateCourse.updateCourse(_controllerProgress.courseId.value);
                                        }
                                      }
                                    }
                                    _controllerQuizQuestion.score.value = 0.0; // reset score
                                    await _controllerProgress.getPractices(_controllerProgress.courseId.value);
                                    await _controllerProgress.getUserPractices();
                                    _controllerUpdateCourse.lstIndex.value = false;
                                    _btnLoad.value = false;
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
            "$_finalScore/100",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 140.sp),
          ),
          Image.asset(AssetConstraints.robotHappy),
          buildStarRating(_controllerQuizQuestion.starsValue(_finalScore, _isPronounce)),
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

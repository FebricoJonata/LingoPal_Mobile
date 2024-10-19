// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/secondary_btn_reusable.dart';

class MutlipleChoice extends StatefulWidget {
  const MutlipleChoice({super.key});

  @override
  State<MutlipleChoice> createState() => _MutlipleChoiceState();
}

class _MutlipleChoiceState extends State<MutlipleChoice> {
  final MultipleChoiceController controllerMultiple = Get.find<MultipleChoiceController>();
  final RxInt currentIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool flag = false.obs;
  final RxInt stars = 0.obs;
  var finalScore = 0.0.obs;
  var argument = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: Obx(() => SizedBox(
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
            final question = controllerMultiple.mutlipleData.value?.body?[currentIndex.value].question;
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
            width: 900.w,
            height: 400.h,
            child: Obx(() {
              final choices = controllerMultiple.mutlipleData.value?.body?[currentIndex.value].choices;
              if (choices == null || choices.isEmpty) {
                return const Text("No Choices Available");
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 850.w,
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
                    width: 850.w,
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
                  btnText: "Coba Lagi",
                  width: 700.w,
                  height: 150.h,
                  onClick: () {
                    currentIndex.value = 0;
                    score.value = 0;
                    flag.value = false;
                    stars.value = 0;

                    // Panggil API lagi (jika diperlukan)
                    controllerMultiple.fetchMultipleChoice(argument);
                  },
                ),
                SecondaryBtn(
                  btnText: "Balik ke halaman level",
                  width: 700.w,
                  height: 150.h,
                  onClick: () {},
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
      width: 400.w,
      height: 160.h,
      onClick: () {
        if (choiceText == controllerMultiple.mutlipleData.value?.body?[currentIndex.value].answerKey) {
          score + 1;
        }
        if (currentIndex.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
          currentIndex.value += 1;
        } else {
          finalScore.value = (score.value / controllerMultiple.mutlipleData.value!.body!.length) * 100;
          flag.value = true;
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

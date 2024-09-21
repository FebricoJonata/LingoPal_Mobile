// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
// import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
// import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
// import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

// class MutlipleChoice extends StatefulWidget {
//   const MutlipleChoice({super.key});

//   @override
//   State<MutlipleChoice> createState() => _MutlipleChoiceState();
// }

// class _MutlipleChoiceState extends State<MutlipleChoice> {
//   var controllerMultiple = Get.find<MultipleChoiceController>();

//   var index = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: MyColors.secondaryYellow,
//       body: SizedBox(
//         width: 1179.w,
//         height: 2700.h,
//         child: Column(
//           children: [
//             Image.asset(AssetConstraints.bgQuiz),
//             Flexible(
//               flex: 2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(AssetConstraints.robotQuiz),
//                   SizedBox(
//                     height: 40.h,
//                   ),
//                   Obx(() => SizedBox(
//                         width: 900.w,
//                         child: Text(
//                           controllerMultiple.mutlipleData.value?.body?[index.value].question.toString() ?? "No Data",
//                           style: TextStyle(color: MyColors.primaryGreen, fontSize: 75.sp, fontWeight: FontWeight.w600),
//                           textAlign: TextAlign.center,
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: MyColors.primaryYellow,
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(70.sp), topRight: Radius.circular(70.sp))),
//                 child: Center(
//                   child: Container(
//                     width: 900.w,
//                     height: 400.h,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Obx(() => Container(
//                               width: 850.w,
//                               height: 175.h,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   PrimaryBtn(
//                                     btnText: controllerMultiple.mutlipleData.value?.body?[index.value].choices?[0]
//                                             .toString() ??
//                                         "",
//                                     width: 400.w,
//                                     height: 160.h,
//                                     onClick: () {
//                                       if (index.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
//                                         index.value += 1;
//                                       }

//                                       // controllerMultiple.checkAnswer(
//                                       //     controllerMultiple.mutlipleData.value?.body?[index.value].choices?[0]
//                                       //             .toString() ??
//                                       //         "",
//                                       //     controllerMultiple.mutlipleData.value?.body?[index.value].answerKey
//                                       //             .toString() ??
//                                       //         "",
//                                       //     index.value);
//                                     },
//                                   ),
//                                   PrimaryBtn(
//                                       btnText: controllerMultiple.mutlipleData.value?.body?[index.value].choices?[1]
//                                               .toString() ??
//                                           "",
//                                       width: 400.w,
//                                       height: 160.h,
//                                       onClick: () {
//                                         if (index.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
//                                           index.value += 1;
//                                         }
//                                         // controllerMultiple.checkAnswer(
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].choices?[1]
//                                         //             .toString() ??
//                                         //         "",
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].answerKey
//                                         //             .toString() ??
//                                         //         "",
//                                         //     index.value);
//                                       })
//                                 ],
//                               ),
//                             )),
//                         Obx(() => Container(
//                               width: 850.w,
//                               height: 175.h,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   PrimaryBtn(
//                                       btnText: controllerMultiple.mutlipleData.value?.body?[index.value].choices?[2]
//                                               .toString() ??
//                                           "",
//                                       width: 400.w,
//                                       height: 160.h,
//                                       onClick: () {
//                                         if (index.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
//                                           index.value += 1;
//                                         }
//                                         // controllerMultiple.checkAnswer(
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].choices?[2]
//                                         //             .toString() ??
//                                         //         "",
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].answerKey
//                                         //             .toString() ??
//                                         //         "",
//                                         //     index.value);
//                                       }),
//                                   PrimaryBtn(
//                                       btnText: controllerMultiple.mutlipleData.value?.body?[index.value].choices?[3]
//                                               .toString() ??
//                                           "",
//                                       width: 400.w,
//                                       height: 160.h,
//                                       onClick: () {
//                                         if (index.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
//                                           index.value += 1;
//                                         }
//                                         // controllerMultiple.checkAnswer(
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].choices?[3]
//                                         //             .toString() ??
//                                         //         "",
//                                         //     controllerMultiple.mutlipleData.value?.body?[index.value].answerKey
//                                         //             .toString() ??
//                                         //         "",
//                                         //     index.value);
//                                       })
//                                 ],
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class MutlipleChoice extends StatefulWidget {
  const MutlipleChoice({super.key});

  @override
  State<MutlipleChoice> createState() => _MutlipleChoiceState();
}

class _MutlipleChoiceState extends State<MutlipleChoice> {
  final MultipleChoiceController controllerMultiple = Get.find<MultipleChoiceController>();
  final RxInt currentIndex = 0.obs;

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
            Image.asset(AssetConstraints.bgQuiz),
            _buildQuizContent(),
            _buildAnswerChoices(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizContent() {
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

  Widget _buildAnswerChoices() {
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

  Widget _buildChoiceButton(String choiceText, int choiceIndex) {
    return PrimaryBtn(
      btnText: choiceText,
      width: 400.w,
      height: 160.h,
      onClick: () {
        if (currentIndex.value < controllerMultiple.mutlipleData.value!.body!.length - 1) {
          currentIndex.value += 1;
        }
        // Uncomment this if you want to use the checkAnswer method:
        // controllerMultiple.checkAnswer(choiceText);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_active.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_disable.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_done.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

import '../../../controllers/home_controllers/course_API_controller.dart';
import '../../../controllers/home_controllers/progress_course_API_controller.dart';
import '../../../controllers/quiz_controller/course_update.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

List<PracticeProgress> mapPracticeProgress(practices, userPractices) {
  List<PracticeProgress> practiceProgress = [];
  if (userPractices.isEmpty) {
    return practiceProgress;
  }

  for (var userPractice in userPractices) {
    for (var practice in practices) {
      if (userPractice.practiceId == practice.practiceId) {
        practiceProgress.add(userPractice);
      }
    }
  }
  return practiceProgress;
}

void checkPracticeProgress(practiceProgress) {
  for (PracticeProgress practiceProgress in practiceProgress) {
    String? levelNum = practiceProgress.practiceCode?.code;
    int? levelId = practiceProgress.practiceId;
    print("After mapping Practices: $levelNum, $levelId");
  }
}

class _PracticePageState extends State<PracticePage> {
  final _controllerQuiz = Get.find<QuestionsController>();
  final _controllerPractice = Get.find<PracticeCourseController>();
  final _controllerCourseUpdate = Get.find<CourseUpdateController>();
  final _controllerProgress = Get.find<ProgressAPIController>();
  final _controllerCourse = Get.find<CourseController>();
  @override
  void initState() {
    super.initState();
    // Fetch data when the page is initialized
    Course course = Get.arguments['course'];
    _controllerPractice.courseId.value = course.courseId ?? 0;
    _controllerPractice.getPractices(course.courseId!);
    _controllerPractice.getUserPractices();
  }

  @override
  Widget build(BuildContext context) {
    Course course = Get.arguments['course'];

    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            SizedBox(height: 100.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() {
                var practices = _controllerPractice.practices.value?.body;
                var userPractices = _controllerPractice.practiceProgress.value?.body;

                if (_controllerPractice.isLoading.value) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  );
                } else if (practices == null || userPractices == null) {
                  return const Text("No data");
                } else {
                  String lastPracticeCode;
                  List<PracticeProgress> practiceProgress;
                  practiceProgress = (userPractices.isEmpty) ? [] : mapPracticeProgress(practices, userPractices);
                  checkPracticeProgress(practiceProgress);
                  int userPracticeLength = practiceProgress.length;
                  lastPracticeCode = (practiceProgress.isEmpty) ? "0" : practiceProgress.last.practiceCode!.code!;
                  int lastPracticeNum = int.parse(lastPracticeCode);
                  String activePracticeCode = (lastPracticeNum + 1).toString();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                BackBtn(
                                  ontap: () {
                                    _controllerProgress.getProgress();
                                    _controllerCourse.getCourses();
                                    _controllerCourse.getUserCourseProgress();
                                    Get.back();
                                  },
                                ),
                                SizedBox(
                                  width: 80.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.courseName ?? "Course Name",
                                        style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        course.category!.courseCategoryName ?? "Course Category",
                                        style: TextStyle(fontSize: 50.sp),
                                      ),
                                      Text(course.courseDescription ?? "Course description", style: TextStyle(fontSize: 50.sp))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              showDuration: const Duration(seconds: 10),
                              richMessage: WidgetSpan(
                                  child: Container(
                                constraints: BoxConstraints(maxWidth: 400.w),
                                child: Text(
                                  "practice_rule".tr,
                                  style: const TextStyle(color: MyColors.white),
                                ),
                              )),
                              child: const Icon(
                                Icons.info_rounded,
                                color: MyColors.secondaryGreen,
                              ))
                        ],
                      ),
                      SizedBox(height: 100.h),
                      if (practices.isEmpty)
                        const Text("Belum terdapat latihan untuk course ini")
                      else
                        GridView.count(
                          crossAxisSpacing: 50.w,
                          mainAxisSpacing: 100.h,
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          childAspectRatio: (1 / 1.25),
                          children: [
                            for (PracticeDetail practice in practices)
                              if (practice.practiceCode == activePracticeCode)
                                ActivePractice(
                                  onTap: course.category?.courseCategoryName == "Pronounciation"
                                      ? () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            _controllerCourseUpdate.lstIndex.value = true;
                                          }
                                          await _controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          // _controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          _controllerPractice.practiceId.value = practice.practiceId ?? 0;
                                          Get.toNamed(RouteName.quiz, arguments: {"idPractice": practice.practiceId, "progressLength": userPracticeLength});
                                        }
                                      : () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            _controllerCourseUpdate.lstIndex.value = true;
                                          }

                                          await _controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          // _controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          _controllerPractice.practiceId.value = practice.practiceId ?? 0;
                                          Get.toNamed(RouteName.multipleChoice, arguments: userPracticeLength);
                                        },
                                  id: practice.practiceId!,
                                  code: practice.practiceCode!,
                                )
                              else if (int.parse(practice.practiceCode!) <= lastPracticeNum)
                                PracticeDone(
                                  onTap: course.category?.courseCategoryName == "Pronounciation"
                                      ? () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            _controllerCourseUpdate.lstIndex.value = true;
                                          }

                                          await _controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          // _controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          _controllerPractice.practiceId.value = practice.practiceId ?? 0;

                                          Get.toNamed(RouteName.quiz, arguments: {"idPractice": practice.practiceId, "progressLength": userPracticeLength});
                                        }
                                      : () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            _controllerCourseUpdate.lstIndex.value = true;
                                          }

                                          await _controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          // _controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          _controllerPractice.practiceId.value = practice.practiceId ?? 0;

                                          Get.toNamed(RouteName.multipleChoice, arguments: userPracticeLength);
                                        },
                                  practiceDone: practiceProgress[practices.indexOf(practice)],
                                )
                              else
                                const DisablePractice()
                          ],
                        ),
                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

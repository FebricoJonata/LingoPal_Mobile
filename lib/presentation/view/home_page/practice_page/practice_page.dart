import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
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
    String? levelNum = practiceProgress.practice?.practiceCode;
    int? levelId = practiceProgress.practiceId;
    print("After mapping Practices: $levelNum, $levelId");
  }
}

class _PracticePageState extends State<PracticePage> {
  var controllerQuiz = Get.find<QuestionsController>();
  var controllerPractice = Get.find<PracticeCourseController>();
  var controllerCourseUpdate = Get.find<CourseUpdateController>();
  var controllerProgress = Get.find<ProgressAPIController>();
  var controllerCourse = Get.find<CourseController>();
  @override
  void initState() {
    super.initState();
    // Fetch data when the page is initialized
    Course course = Get.arguments['course'];
    controllerPractice.courseId.value = course.courseId ?? 0;
    controllerPractice.getPractices(course.courseId!);
    controllerPractice.getUserPractices();
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
                var practices = controllerPractice.practices.value?.body;
                var userPractices = controllerPractice.practiceProgress.value?.body;

                if (controllerPractice.isLoading.value) {
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
                  lastPracticeCode = (practiceProgress.isEmpty) ? "0" : practiceProgress.last.practice!.practiceCode!;
                  int lastPracticeNum = int.parse(lastPracticeCode);
                  String activePracticeCode = (lastPracticeNum + 1).toString();

                  return Column(
                    children: [
                      Row(
                        children: [
                          BackBtn(
                            ontap: () async {
                              await controllerProgress.getProgress();
                              await controllerCourse.getCourses();
                              await controllerCourse.getUserCourseProgress();
                              Get.back();
                            },
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Column(
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
                              Text(
                                course.courseDescription ?? "Course description",
                                style: TextStyle(fontSize: 50.sp),
                              )
                            ],
                          )
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
                            for (Practice practice in practices)
                              if (practice.practiceCode == activePracticeCode)
                                ActivePractice(
                                  onTap: course.category?.courseCategoryName == "Pelafalan"
                                      ? () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            controllerCourseUpdate.lstIndex.value = true;
                                          }
                                          await controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          controllerPractice.practiceId.value = practice.practiceId ?? 0;
                                          Get.toNamed(RouteName.quiz, arguments: practice.practiceId);
                                        }
                                      : () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            controllerCourseUpdate.lstIndex.value = true;
                                          }
                                          await controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          controllerPractice.practiceId.value = practice.practiceId ?? 0;
                                          Get.toNamed(RouteName.multipleChoice);
                                        },
                                  id: practice.practiceId!,
                                  code: practice.practiceCode!,
                                )
                              else if (int.parse(practice.practiceCode!) <= lastPracticeNum)
                                PracticeDone(
                                  onTap: course.category?.courseCategoryName == "Pelafalan"
                                      ? () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            controllerCourseUpdate.lstIndex.value = true;
                                          }
                                          await controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          controllerPractice.practiceId.value = practice.practiceId ?? 0;

                                          Get.toNamed(RouteName.quiz, arguments: practice.practiceId);
                                        }
                                      : () async {
                                          int tappedIndex = practices.indexOf(practice);
                                          if (tappedIndex == practices.length - 1) {
                                            controllerCourseUpdate.lstIndex.value = true;
                                          }
                                          await controllerQuiz.fetchQuestions(practice.practiceId ?? 0);
                                          controllerPractice.indexPractice.value = practices.indexOf(practice);
                                          controllerPractice.practiceId.value = practice.practiceId ?? 0;

                                          Get.toNamed(RouteName.multipleChoice);
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

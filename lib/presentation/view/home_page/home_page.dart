// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_active_card.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_disabled_card.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool alertShown = false;
  var courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(children: [
          CustomAppBar(),
          SizedBox(height: 150.h),
          Expanded(
            child: Obx(() {
              var courseList = courseController.courses.value?.body ?? [];
              var activeCourses = courseController.courseProgress.value?.body ?? [];

              if (courseController.isLoading.isTrue || courseController.courseProgress.value == null || courseController.courses.value == null) {
                return Text("loading".tr);
              } else if (courseController.errorMessage.isNotEmpty) {
                return Text(courseController.errorMessage.value);
              } else if (courseList.isEmpty) {
                return const Text("No courses found");
              } else {
                return RefreshIndicator(
                  color: MyColors.primaryGreen,
                  onRefresh: () async {
                    await courseController.getCourses();
                    await courseController.getUserCourseProgress();
                  },
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(20, 50.h, 20, 300.h),
                    shrinkWrap: true,
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      var course = courseList[index];
                      if (index < activeCourses.length) {
                        if (activeCourses[index].isActive == true) {
                          return CourseActiveCard(
                            course: course,
                            userProgressPoin: activeCourses[index].progressPoin ?? 0,
                          );
                        }
                      }
                      return Tooltip(
                        message: "You have to complete previous course with a minimum of ${course.minPoin} points",
                        child: CourseDisabledCard(
                          course: course,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 50.h);
                    },
                  ),
                );
              }
            }),
          ),
        ]),
      ),
    );
  }

  // void showCustomAlertDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Alert(
  //         imagePath: "assets/images/robots/cool.png",
  //         title: 'Aplikasi kami ramah disabilitas!',
  //         message:
  //             'Sebagai upaya mendukung penyandang disabilitas untuk mendapatkan edukasi yang maksimal, kami menyediakan fitur yang dapat menunjang pembelajaran bahasa Inggris bagi teman-teman.\n\nJika ingin menggunakan fitur tersebut, silakan pindah ke halaman Profile -> Pengaturan Disabilitas',
  //         onClose: () async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //           await prefs.setBool('alertShown', true);
  //           setState(() {
  //             _alertShown = true;
  //           });
  //           Navigator.of(context).pop();
  //         },
  //       );
  //     },
  //   );
  // }
}

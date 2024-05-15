// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
// import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';
// import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_disabled.card.dart';
// import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/home_appbar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool _alertShown = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     if (_alertShown != true) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         showCustomAlertDialog(context);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 1179.w,
//         height: 2556.h,
//         color: MyColors.secondaryYellow,
//         child: Column(children: [
//           // app bar
//           const CustomAppBar(),
//           SizedBox(
//             height: 150.h,
//           ),
//           Expanded(
//             child: ListView.separated(
//               padding: EdgeInsets.fromLTRB(20, 50.h, 20, 300.h),
//               shrinkWrap: true,
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return CourseDisabledCard();
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(
//                   height: 50.h,
//                 );
//               },
//             ),
//           )
//           // content
//         ]),
//       ),
//     );
//   }

//   void showCustomAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Alert(
//           imagePath: "assets/images/robots/cool.png",
//           title: 'Aplikasi kami ramah disabilitas!',
//           message:
//               'Sebagai upaya mendukung penyandang disabilitas untuk mendapatkan edukasi yang maksimal, kami menyediakan fitur yang dapat menunjang pembelajaran bahasa Inggris bagi teman-teman.\n\nJika ingin menggunakan fitur tersebut, silakan pindah ke halaman Profile -> Pengaturan Disabilitas',
//           onClose: () {
//             setState(() {
//               _alertShown = true;
//               print(_alertShown);
//             });
//             Navigator.of(context).pop();
//           },
//         );
//       },
//     );
//   }
// }

// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_active_card.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/course_disabled.card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _alertShown = false;
  // List<CourseProgress> activeCourses = [];

  @override
  void initState() {
    super.initState();
    _checkAlertStatus();
  }

  Future<void> _checkAlertStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alertShown = prefs.getBool('alertShown') ?? false;
    if (!alertShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showCustomAlertDialog(context);
      });
    }
  }

  // Future<void> __checkActiveCourses() async {
  //   var courseController = Get.find<CourseController>();
  //   // var activeCourseFunc = await courseController.getUserCourseProgress();
  //   print("Sampai sini aman");
  //   if(courseController.courseProgress.value?.courseProgress != null){
  //     activeCourses = courseController.courseProgress.value!.courseProgress!;
  //   }
  //   print("Active courses: {$activeCourses}"); 
  // }

  

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
            child: GetBuilder<CourseController>(
              builder: (controllerCourse) {
                print("masuk ke course controller");
                // return FutureBuilder(
                //   future: controllerCourse.getCourses(), 
                //   builder: (context, snapshot) {
                //     if(snapshot.connectionState == ConnectionState.waiting){
                //       return CircularProgressIndicator();
                //     }
                //     else if (snapshot.hasError) {
                //       return Text("Error");
                //     }
                //     else if (snapshot.data == null){
                //       return Text("No data");
                //     }
                //     else {
                //       // __checkActiveCourses();
                //       var courseList = controllerCourse.courses.value?.body;
                //       if(courseList==null || courseList.isEmpty){
                //         return Text("No course found");
                //       }
                //       return ListView.separated(
                //         padding: EdgeInsets.fromLTRB(20, 50.h, 20, 300.h),
                //         shrinkWrap: true,
                //         itemCount: courseList.length,
                //         itemBuilder: (context, index) {
                //           var course = courseList[index];
                //           if (activeCourses.isNotEmpty){
                //             var lastActiveCourse = activeCourses.last;
                //             var lastActiveCourseId = lastActiveCourse.courseId!;

                //             if (index <= lastActiveCourseId){
                //               return CourseActiveCard(course: course,);
                //             }
                //           }
                //           return CourseDisabledCard();
                //         },
                //         separatorBuilder: (BuildContext context, int index) {
                //           return SizedBox(height: 50.h);
                //         },
                //       );
                //     }
                //   }
                // );
                return FutureBuilder(
                  future: Future.wait([controllerCourse.getCourses(), controllerCourse.getUserCourseProgress()]), 
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Text("Loading ...");
                    }
                    else if (snapshot.hasError) {
                      return Text("Error");
                    }
                    else if (snapshot.data == null){
                      return Text("No data");
                    }
                    else {
                      // __checkActiveCourses();
                      var courseList = controllerCourse.courses.value?.body;
                      var activeCourses = controllerCourse.courseProgress.value?.body;
                      print("sementara aman disinii");
                      print("COURSE LIST: {$courseList}");
                      print("ACTIVE: {$activeCourses}");
                      int lastCourseId = (activeCourses != null) ? activeCourses.last.courseId! : 0;
                      
                      if(courseList==null || courseList.isEmpty){
                        return Text("No course found");
                      }

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(20, 50.h, 20, 300.h),
                        shrinkWrap: true,
                        itemCount: courseList.length,
                        itemBuilder: (context, index) {
                          var course = courseList[index];
                          if (index < lastCourseId){
                            return CourseActiveCard(course: course,);
                          }
                          return CourseDisabledCard();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 50.h);
                        },
                      );
                    }
                  },
                );
              }
            ),
          ),
        ]),
      ),
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Alert(
          imagePath: "assets/images/robots/cool.png",
          title: 'Aplikasi kami ramah disabilitas!',
          message:
              'Sebagai upaya mendukung penyandang disabilitas untuk mendapatkan edukasi yang maksimal, kami menyediakan fitur yang dapat menunjang pembelajaran bahasa Inggris bagi teman-teman.\n\nJika ingin menggunakan fitur tersebut, silakan pindah ke halaman Profile -> Pengaturan Disabilitas',
          onClose: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('alertShown', true);
            setState(() {
              _alertShown = true;
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

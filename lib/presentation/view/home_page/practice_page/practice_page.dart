import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_api_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_active.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_disable.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_done.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  var controllerPracticeCourse = Get.find<PracticeCourseController>();
  @override
  Widget build(BuildContext context) {
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
              child: GetBuilder<PracticeCourseController>(
                builder: (controllerPractice) {
                  return FutureBuilder(
                    future: controllerPracticeCourse.getPractices(), 
                    builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      else if(snapshot.hasError){
                        return Text("Error retrieve data");
                      }
                      else if (snapshot.data == null){
                        return Text("No data");
                      }
                      else {
                        var practices = controllerPractice.practices.value?.body;
                        var course = controllerPractice.practices.value?.body?.first.course;
                      return Column(
                        children: [
                          Row(
                            children: [
                              const BackBtn(),
                              SizedBox(width: 80.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(course?.courseName??"Course Name", style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),),
                                  Text(course?.courseName??"Course description", style: TextStyle(fontSize: 50.sp),)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 200.h),
                          GridView.count(
                            crossAxisSpacing: 50.w,
                            mainAxisSpacing: 100.h,
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            childAspectRatio: (1/1.25),
                            children: [
                              for(int i=0; i<practices!.length; i++)
                                if(i==6)
                                  ActivePractice(id: practices[i].practiceId!, code: practices[i].practiceCode!,)
                                else if(i<6)
                                  PracticeDone(id: practices[i].practiceId!, code: practices[i].practiceCode!,)
                                else
                                  DisablePractice()
                            ],
                          ),
                        ],
                      );
                      }
                    }
                  );
                }
              ),
              // ),
            ),
          ],
        ),
      )
    );
  }
}
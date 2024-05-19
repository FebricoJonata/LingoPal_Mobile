import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_active.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_disable.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/widgets/practice_done.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

List<PracticeProgress> mapPracticeProgress(List<Practice>practices, List<PracticeProgress>userPractices){
  List<PracticeProgress> practiceProgress = [];
  if(userPractices.isEmpty ){
    return practiceProgress;
  }

  for (var userPractice in userPractices) {
    for (var practice in practices) {
      if(userPractice.practiceId==practice.practiceId){
        practiceProgress.add(userPractice);
      }
      else {
        print("No matching things");
      }
    }
  }
  print(practiceProgress);
  return practiceProgress;
}

void checkPracticeProgress(practiceProgress){
  for (PracticeProgress practiceProgress in practiceProgress) {
    String? levelNum = practiceProgress.practice?.practiceCode;
    int? levelId = practiceProgress.practiceId;
    print("After mapping Practices: $levelNum, $levelId");
  }
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {

    final int courseId = Get.arguments['course_id'];
    print('course id in practice page: {$courseId}');

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
                    future: Future.wait([controllerPractice.getPractices(courseId), controllerPractice.getUserPractices()]), 
                    builder: (context, snapshot){
                      var practices = controllerPractice.practices.value?.body;
                      // print("Here");
                      // print(practices);
                      var userPractices = controllerPractice.practiceProgress.value?.body;

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      else if(snapshot.hasError){
                        return Text("Error retrieve data");
                      }
                      else if (snapshot.data == null || practices == null || userPractices==null){
                        return Text("No data");
                      }
                      else {
                        if(practices.isEmpty){
                          print("Empty practices");
                          return Row(
                            children: [
                              BackBtn(),
                              SizedBox(width: 30.w,),
                              Text("No practices"),
                            ],
                          );
                        }

                        var course = controllerPractice.practices.value?.body?.first.course;
                        String lastPracticeCode; List<PracticeProgress>practiceProgress;
                        if(userPractices.isEmpty){
                          practiceProgress = [];
                        }
                        else {
                          practiceProgress = mapPracticeProgress(practices, userPractices);
                        }

                        if(practiceProgress.isEmpty){
                          lastPracticeCode = "0";
                        }
                        else {
                          checkPracticeProgress(practiceProgress);
                          lastPracticeCode = practiceProgress.last.practice!.practiceCode!;
                        }

                        var activePracticeInt = (int.parse(lastPracticeCode) + 1).toString;
                        int lastPracticeNum = int.parse(lastPracticeCode);
                        int activePracticeNum = lastPracticeNum + 1;
                        String activePracticeCode = activePracticeNum.toString();
                        print("Active Level: $activePracticeCode");
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
                                    Text(course?.courseDescription??"Course description", style: TextStyle(fontSize: 50.sp),)
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
                                for (Practice practice in practices!)
                                  if(practice.practiceCode == activePracticeCode)
                                    ActivePractice(id: practice.practiceId!, code: practice.practiceCode!,)
                                  else if(int.parse(practice.practiceCode!) <= lastPracticeNum)
                                    PracticeDone(practiceDone: practiceProgress[practices.indexOf(practice)],)
                                  else
                                    DisablePractice()
                                
                                // for(int i=0; i<practices!.length; i++)
                                //   if(i==lastPracticeId+1)
                                //     ActivePractice(id: practices[i].practiceId!, code: practices[i].practiceCode!,)
                                //   else if(i<lastPracticeId)
                                //     PracticeDone(id: practices[i].practiceId!, code: practices[i].practiceCode!,)
                                //   else
                                //     DisablePractice()
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
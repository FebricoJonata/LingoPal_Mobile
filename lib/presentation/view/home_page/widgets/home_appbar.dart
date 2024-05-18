// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/progress_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/progress_model.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  var controllerProfile = Get.find<GetProfileController>();
  var controllerProgress = Get.find<ProgressAPIController>();
  @override
  Widget build(BuildContext context) {
    final fomattedName = controllerProfile.profile.value?.body?.data?.first.name?.split(' ') ?? [];
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
            decoration: BoxDecoration(
                color: MyColors.primaryYellow,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(75.sp), bottomRight: Radius.circular(75.sp))),
            child: Column(
              children: [
                Image.asset(AssetConstraints.bgIntroTop),
                GetBuilder<GetProfileController>(
                  builder: (_) {
                    return Container(
                      height: 350.h,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(horizontal: 100.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColors.primaryGreen,
                                foregroundColor: MyColors.secondaryYellow,
                                radius: 60.h,
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Text(
                                controllerProfile.profile.value?.body?.data?.first.name ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              const Icon(
                                Icons.waving_hand_rounded,
                                color: MyColors.secondaryYellow,
                              )
                            ],
                          ),
                          IconButton(
                            iconSize: 36,
                            icon: const Icon(Icons.notifications),
                            onPressed: () {
                              print("To Notif");
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            )),
        Positioned(
            bottom: -100.h,
            child: GetBuilder<ProgressAPIController>(
              builder: (controllerProgress) {
                return FutureBuilder(
                  future: controllerProgress.getProgress(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: 100.w,
                        height: 70.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.data == null) {
                      return const Text("DATA NULL");
                    } else {
                      final progressData = snapshot.data!.fold((failure) => <ProgressUserModel>[], (l) => l.body);

                      if (progressData == null) {
                        return const Center(
                          child: Text('No'),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              color: MyColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                )
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(50.sp))),
                          width: 979.w,
                          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 64.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Level: ${controllerProgress.progress.value?.body?.data?.first.level?.userLevelCode} ${controllerProgress.progress.value?.body?.data?.first.level?.userLevelName}",
                                  style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                              Container(
                                width: 2,
                                height: 100.h,
                                color: MyColors.lightGrey,
                              ),
                              Row(children: [
                                Text("${controllerProgress.progress.value?.body?.data?.first.totalPoin}",
                                    style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.star_rounded,
                                  color: MyColors.primaryYellow,
                                )
                              ])
                            ],
                          ),
                        );
                      }
                    }
                  },
                );
              },
            )),
      ],
    );
  }
}

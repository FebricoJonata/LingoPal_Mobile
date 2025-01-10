// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/progress_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/profile_model/profile_model.dart';
// import 'package:lingo_pal_mobile/presentation/model/home_model/progress_model.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  var controllerProfile = Get.find<GetProfileController>();
  var controllerProgress = Get.find<ProgressAPIController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
            decoration: BoxDecoration(color: MyColors.primaryYellow, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.sp), bottomRight: Radius.circular(75.sp))),
            child: Column(
              children: [
                Image.asset(AssetConstraints.bgIntroTop),
                Obx(() {
                  if (controllerProgress.isLoading.value) {
                    return SizedBox(
                      width: 150.w,
                      height: 300.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                      ),
                    );
                  } else if (controllerProgress.progress.value == null) {
                    return const Text("DATA NULL");
                  } else {
                    final progressData = controllerProgress.progress.value!.body;

                    if (progressData == null) {
                      return const Center(
                        child: Text('Missing data in appbar'),
                      );
                    } else {
                      String? userName = Profile().body?.data?.first.name;

                      return Stack(
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 350.h,
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.symmetric(horizontal: 100.w),
                            child: Row(
                              children: [
<<<<<<< HEAD
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: Profile().body?.data?.first.image == null || Profile().body?.data?.first.image == ''
                                          ? const NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg")
                                          : NetworkImage(Profile().body?.data?.first.image ?? ""),
                                      backgroundColor: MyColors.primaryGreen,
                                      foregroundColor: MyColors.secondaryYellow,
                                      radius: 60.h,
                                    ),
                                    SizedBox(width: 50.w),
                                    Text(
                                      userName ?? "",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
                                    ),
                                    SizedBox(width: 50.w),
                                    const Icon(
                                      Icons.waving_hand_rounded,
                                      color: MyColors.secondaryYellow,
                                    )
                                  ],
=======
                                CircleAvatar(
                                  backgroundImage: controllerProfile.profile.value?.body?.data?.first.image == null || controllerProfile.profile.value?.body?.data?.first.image == ''
                                      ? const NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg")
                                      : NetworkImage(controllerProfile.profile.value?.body?.data?.first.image ?? ""),
                                  backgroundColor: MyColors.primaryGreen,
                                  foregroundColor: MyColors.secondaryYellow,
                                  radius: 60.h,
                                ),
                                SizedBox(width: 50.w),
                                Flexible(
                                  child: Text(
                                    userName ?? "",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
                                  ),
                                ),
                                SizedBox(width: 50.w),
                                const Icon(
                                  Icons.waving_hand_rounded,
                                  color: MyColors.secondaryYellow,
>>>>>>> 5c4e3c0998955108f921d6eb98ce3a58138e9f52
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -100.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.white,
                                  boxShadow: const [
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
                                      style: const TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                                  Container(
                                    width: 2,
                                    height: 100.h,
                                    color: MyColors.lightGrey,
                                  ),
                                  Row(children: [
                                    Obx(() =>
                                        Text("${controllerProgress.progress.value?.body?.data?.first.totalPoin}", style: const TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold))),
                                    const Icon(
                                      Icons.star_rounded,
                                      color: MyColors.primaryYellow,
                                    )
                                  ])
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  }
                })
              ],
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var controllerProfile = Get.find<GetProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: GetBuilder<GetProfileController>(
      builder: (controllerProfile) {
        return Container(
            width: 1179.w,
            height: 2700.h,
            color: MyColors.secondaryYellow,
            child: Column(children: [
              Image.asset(AssetConstraints.bgAppLogo),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: 1179.w,
                height: 500.h,
                child: Column(
                  children: [
                    SizedBox(
                      width: 1179.w,
                      height: 125.h,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: MyColors.primaryGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 60.sp,
                            ),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          SizedBox(
                            width: 410.w,
                            child: Divider(
                              color: MyColors.primaryGreen,
                              thickness: 4.sp,
                            ),
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                          InkWell(
                            onTap: () => Get.offNamed(RouteName.editPage,
                                arguments: controllerProfile.profile.value!.body!.data!.first.userId),
                            child: Container(
                              width: 200.w,
                              height: 95.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: MyColors.primaryGreen,
                              ),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: MyColors.white, fontSize: 40.sp),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1179.w,
                      height: 375.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 150.w,
                          ),
                          SizedBox(
                            width: 80.w,
                          ),

                          SizedBox(
                            width: 500.w,
                            height: 375.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controllerProfile.profile.value!.body!.data!.first.name ?? "",
                                    style: TextStyle(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controllerProfile.profile.value!.body!.data!.first.birthDate ?? "",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          )
                          // }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: 1179.w,
                height: 500.h,
                child: Column(
                  children: [
                    SizedBox(
                      width: 1179.w,
                      height: 125.h,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              color: MyColors.primaryGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 60.sp,
                            ),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          SizedBox(
                            width: 410.w,
                            child: Divider(
                              color: MyColors.primaryGreen,
                              thickness: 4.sp,
                            ),
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                          Container(
                            width: 200.w,
                            height: 95.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: MyColors.primaryGreen,
                            ),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(color: MyColors.white, fontSize: 40.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1179.w,
                      height: 375.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 475.w,
                            height: 375.h,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Telephone Number",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Password",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 575.w,
                            height: 375.h,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controllerProfile.profile.value!.body!.data!.first.email ?? "",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controllerProfile.profile.value!.body!.data!.first.phoneNumber ?? "",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "***************",
                                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: 1179.w,
                height: 800.h,
                child: Column(
                  children: [
                    SizedBox(
                      width: 1179.w,
                      height: 125.h,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Misc",
                            style: TextStyle(
                              color: MyColors.primaryGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 60.sp,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 410.w,
                            child: Divider(
                              color: MyColors.primaryGreen,
                              thickness: 4.sp,
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      width: 1179.w,
                      height: 600.h,
                      child: Column(
                        children: [
                          Container(
                            width: 1179.w,
                            height: 125.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 1179.w,
                                height: 100.h,
                                margin: const EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        Text("FAQ", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            width: 1179.w,
                            height: 125.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 1179.w,
                                height: 100.h,
                                margin: const EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Terms and Conditions",
                                        style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            width: 1179.w,
                            height: 125.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 1179.w,
                                height: 100.h,
                                margin: const EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Rating and Review",
                                        style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            width: 1179.w,
                            height: 125.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 1179.w,
                                height: 100.h,
                                margin: const EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("About Us",
                                        style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]));
      },
    )));
  }
}

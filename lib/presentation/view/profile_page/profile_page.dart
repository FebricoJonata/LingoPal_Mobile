import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

import '../../controllers/choice_chip_controller.dart';
import '../components/localization.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var controllerProfile = Get.find<GetProfileController>();
  var controllerChoice = Get.find<ChoicesController>();
  var storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: GetBuilder<GetProfileController>(
      builder: (controllerProfile) {
        return Container(
            width: 1179.w,
            height: 2900.h,
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
                            "profile".tr,
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
                            onTap: () {
                              Get.toNamed(RouteName.editPage, arguments: controllerProfile.profile.value?.body!.data!.first.userId);
                            },
                            child: Container(
                              width: 200.w,
                              height: 95.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: MyColors.primaryGreen,
                              ),
                              child: Center(
                                child: Text(
                                  "edit".tr,
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
                          GetBuilder<GetProfileController>(
                            builder: (controllerProfile) {
                              return Obx(() => CircleAvatar(
                                    radius: 150.w,
                                    backgroundImage: controllerProfile.profile.value?.body?.data?.first.image == null || controllerProfile.profile.value?.body?.data?.first.image == ''
                                        ? const NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg")
                                        : NetworkImage(controllerProfile.profile.value?.body?.data?.first.image ?? ""),
                                  ));
                            },
                          ),
                          SizedBox(
                            width: 80.w,
                          ),

                          SizedBox(
                            width: 500.w,
                            height: 375.h,
                            child: Obx(() => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controllerProfile.profile.value?.body?.data?.first.name ?? "",
                                        style: TextStyle(
                                          fontSize: 40.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        controllerProfile.profile.value?.body?.data!.first.birthDate ?? "",
                                        style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
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
                            "account".tr,
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
                            child: IconButton(
                                onPressed: () {
                                  Get.offAllNamed(RouteName.loginPage);
                                  storage.deleteAll();
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 50.sp,
                                )),
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
                                    "password".tr,
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
                                    controllerProfile.profile.value?.body?.data?.first.email ?? "",
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
                height: 1000.h,
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
                            "other".tr,
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
                    Expanded(
                      child: SizedBox(
                        // color: Colors.red,
                        width: 1179.w,
                        height: 900.h,
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
                              child: Obx(() {
                                final isEnglish = TranslationService.currentLang.value == 'English';
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200.w,
                                      height: 100.h,
                                      margin: const EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          isEnglish ? "English" : "Indonesia",
                                          style: TextStyle(
                                            fontSize: 40.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Toggle Switch
                                    Switch(
                                      activeColor: MyColors.primaryGreen,
                                      inactiveTrackColor: MyColors.primaryYellow,
                                      value: !isEnglish, // Switch ON means language is Indonesia
                                      onChanged: (value) {
                                        // Change language based on switch value
                                        final newLang = value ? 'Indonesia' : 'English';
                                        TranslationService.changeLocale(newLang);
                                      },
                                    ),
                                  ],
                                );
                              }),
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
                                  child: Align(alignment: Alignment.centerLeft, child: Text("FAQ", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
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
                                  child: Align(alignment: Alignment.centerLeft, child: Text("termsCondition".tr, style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
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
                                  child: Align(alignment: Alignment.centerLeft, child: Text("ratingReview".tr, style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
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
                                  child: Align(alignment: Alignment.centerLeft, child: Text("aboutUs".tr, style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600)))),
                            )
                          ],
                        ),
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

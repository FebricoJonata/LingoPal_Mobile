import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/choice_chip_edit_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/edit_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/widgets/choice_chip/choice_chip_edit.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController datePickerController = TextEditingController();
  TextEditingController nameContoller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var controllerEdit = Get.find<EditAPIController>();
  var controllerChoice = Get.find<ChoiceEditController>();
  var controllerProfile = Get.find<GetProfileController>();
  int userId = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgAppLogo),
            Flexible(
              child: SizedBox(
                width: 1179.w,
                height: 1800.h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 45.w, vertical: 2.h),
                      width: 1179.w,
                      height: 400.h,
                      child: Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: 393.w,
                              height: 400.h,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () => Get.back(),
                                  child: CircleAvatar(
                                    radius: 50.sp,
                                    backgroundColor: MyColors.secondaryGreen,
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: MyColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 393.w,
                              height: 400.h,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 200.sp,
                                    backgroundColor: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 393.w,
                                    height: 400.h,
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 60.sp,
                                        backgroundColor: MyColors.primaryYellow,
                                        child: const Icon(
                                          Icons.edit,
                                          color: MyColors.primaryGreen,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 393.w,
                              height: 400.h,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    SizedBox(
                      width: 900.w,
                      height: 1000.h,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Full Name",
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          ReuseTextField(
                            controller: nameContoller,
                            obscureText: false,
                            linesMax: 1,
                            linesMin: 1,
                            color: MyColors.white,
                            fontSize: 35.sp,
                            radius: 25.sp,
                            width: double.infinity,
                            height: 120.h,
                            iconTxt: Icons.person,
                            iconSize: 40.sp,
                            labelTxt: "Full Name",
                            maxHeight: 100.h,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          ReuseTextField(
                            controller: phoneController,
                            obscureText: false,
                            linesMax: 1,
                            linesMin: 1,
                            color: MyColors.white,
                            fontSize: 35.sp,
                            radius: 25.sp,
                            width: double.infinity,
                            height: 120.h,
                            iconTxt: Icons.phone,
                            iconSize: 40.sp,
                            labelTxt: "Phone Number",
                            maxHeight: 100.h,
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Gender",
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 1179.w,
                            height: 200.h,
                            child: choiChipEdit(),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Birth Date",
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DatePicker(
                              controller: datePickerController,
                              labelTxt: "BirtDay",
                              iconTxt: Icons.calendar_month,
                              linesMax: 1,
                              linesMin: 1,
                              maxHeight: 100.h,
                              width: double.infinity,
                              color: MyColors.white,
                              radius: 25.sp,
                              fontSize: 45.sp,
                              iconSize: 40.sp,
                              obscureText: false),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    PrimaryBtn(
                      btnText: "Update",
                      width: 300.w,
                      height: 150.h,
                      onClick: () {
                        print("Biji");
                        controllerEdit.editProfileAPI(userId, nameContoller.text, datePickerController.text,
                            controllerChoice.selectedChoice.value?.label ?? "", phoneController.text);
                        controllerProfile.profileAPI();
                        Get.toNamed(RouteName.basePage);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

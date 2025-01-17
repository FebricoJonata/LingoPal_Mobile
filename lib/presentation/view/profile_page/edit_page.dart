// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/picker_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/edit_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/camera_screen/camera_screen.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _nameContoller = TextEditingController();

  final _controllerEdit = Get.find<EditAPIController>();
  final _controllerChoice = Get.find<ChoicesController>();
  final _controllerProfile = Get.find<GetProfileController>();
  final _controllerImage = Get.find<ImagePickerController>();
  final int _userId = Get.arguments;
  final _nameRx = ''.obs;
  final _dateRx = ''.obs;
  final _isFormValid = false.obs;

  String? validateField(String? value, String fieldType) {
    String? error;
    switch (fieldType) {
      case 'Name':
        error = (value == null || value.isEmpty) ? 'Cannot be Empty' : null;
        break;
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _isFormValid.value = (_nameContoller.text.isNotEmpty && _datePickerController.text.isNotEmpty);
    // });

    return error;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 2000.h,
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
                                  Obx(() => CircleAvatar(
                                        radius: 200.sp,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: _controllerImage.imageUrl.value == ""
                                            ? const NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg")
                                            : NetworkImage(_controllerImage.imageUrl.value),
                                      )),
                                  SizedBox(
                                    width: 393.w,
                                    height: 400.h,
                                    child: const Align(alignment: Alignment.bottomRight, child: Camera2()),
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
                      height: 800.h,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "fullName".tr,
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          ReuseTextField(
                            controller: _nameContoller..text = _controllerProfile.profile.value?.body?.first.name ?? "-",
                            obscureText: false,
                            linesMax: 1,
                            linesMin: 1,
                            color: MyColors.white,
                            fontSize: 35.sp,
                            radius: 25.sp,
                            width: double.infinity,
                            height: 150.h,
                            iconTxt: Icons.person,
                            iconSize: 40.sp,
                            labelTxt: "fullName".tr,
                            maxHeight: 100.h,
                            validator: (value) => validateField(value, 'Name'),
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "birthDate".tr,
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DatePicker(
                            controller: _datePickerController..text = _controllerProfile.profile.value?.body?.first.birthDate ?? "-",
                            labelTxt: "YYYY-MM-DD",
                            iconTxt: Icons.calendar_month,
                            linesMax: 1,
                            linesMin: 1,
                            maxHeight: 100.h,
                            width: double.infinity,
                            color: MyColors.white,
                            radius: 25.sp,
                            fontSize: 45.sp,
                            iconSize: 40.sp,
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                    Obx(() => PrimaryBtn(
                        btnText: "update".tr,
                        width: 300.w,
                        height: 150.h,
                        isLoading: _controllerEdit.isLoading.value,
                        onClick: () async {
                          await _controllerEdit.editProfileAPI(_nameContoller.text, _datePickerController.text, _controllerImage.imageUrl.value);
                          _controllerProfile.profileAPI();
                          Get.back();
                        }))
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

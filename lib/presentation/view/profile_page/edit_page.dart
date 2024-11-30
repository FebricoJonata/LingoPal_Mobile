import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/picker_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/edit_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/camera_screen/camera_screen.dart';
import 'package:lingo_pal_mobile/presentation/view/components/choice_chip.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController datePickerController = TextEditingController();
  TextEditingController nameContoller = TextEditingController();

  var controllerEdit = Get.find<EditAPIController>();
  var controllerChoice = Get.find<ChoicesController>();
  var controllerProfile = Get.find<GetProfileController>();
  var controllerImage = Get.find<ImagePickerController>();
  int userId = Get.arguments;
  final RxBool isFormValid = false.obs;

  String? validateField(String? value, String fieldType) {
    String? error;
    switch (fieldType) {
      case 'Email':
        error = (value == null || !value.contains('@')) ? 'Email must contain "@"' : null;
        break;
      case 'Name':
        error = (value == null || value.isEmpty) ? 'Cannot be Empty' : null;
        break;
      case 'Phone Number':
        error = (value == null || value.length < 12 || value.length > 15) ? 'Phone number must be between 12 and 15 digits' : null;
        break;
      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFormValid.value = (nameContoller.text.isNotEmpty);
    });

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
                                        backgroundImage: controllerImage.imageUrl.value == ""
                                            ? const NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg")
                                            : NetworkImage(controllerImage.imageUrl.value),
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
                      height: 1200.h,
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
                            controller: nameContoller..text = controllerProfile.profile.value?.body?.data?[0].name ?? "-",
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
                              "gender".tr,
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 1179.w,
                            height: 200.h,
                            child: ReusableChoiceChip(
                              onSelect: (value) {},
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "birthDate".tr,
                              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DatePicker(
                              controller: datePickerController,
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
                              obscureText: false),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Obx(() => PrimaryBtn(
                          btnText: "update".tr,
                          width: 300.w,
                          height: 150.h,
                          isLoading: controllerEdit.isLoading.value,
                          onClick: isFormValid.value == true
                              ? () async {
                                  await controllerEdit.editProfileAPI(
                                      nameContoller.text, datePickerController.text, controllerChoice.selectedChoice.value?.value ?? "", controllerImage.imageUrl.value);
                                  controllerProfile.profileAPI();
                                  Get.back();
                                }
                              : null,
                        ))
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

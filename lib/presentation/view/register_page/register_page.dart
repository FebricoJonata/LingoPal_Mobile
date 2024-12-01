// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/error/errors.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/register_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/email_alert.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

import '../../controllers/register_page_controller/email_verif_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  final RxBool isFormValid = false.obs;

  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controllerRegis = Get.find<RegisterAPIController>();
  final controllerChoiceChip = Get.find<ChoicesController>();
  var controllerEmailVerif = Get.find<EmailVerifController>();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

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
        error = (value == null || value.length < 10 || value.length > 15) ? 'Phone number must be between 10 and 15 digits' : null;
        break;
      case 'Password':
        error = (value == null || value.isEmpty) ? 'Password cannot be empty' : null;
        break;
      case 'Confirm Password':
        error = (value == null || value.isEmpty)
            ? 'Confirm Password cannot be empty'
            : (value != passwordController.text)
                ? 'Passwords do not match'
                : null;
        break;
      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFormValid.value =
          emailController.text.contains('@') && emailController.text.isNotEmpty && nameController.text.isNotEmpty && passwordController.text.isNotEmpty && passwordController.text == value;
    });

    return error;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   controllerChoiceChip.setChoices(pageChoices);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryYellow,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          width: 1179.w,
          height: 2556.h,
          child: Column(
            children: [
              Image.asset(AssetConstraints.bgAppLogo),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  width: 1179.w,
                  height: 1900.h,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 1179.w,
                        height: 150.h,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CircleAvatar(
                                radius: 50.h,
                                backgroundColor: MyColors.secondaryGreen,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: MyColors.white,
                                  size: 50.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Flexible(
                        child: SizedBox(
                            width: 1179.w,
                            height: 1700.h,
                            child: SingleChildScrollView(
                                child: Obx(
                              () => Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Email",
                                      style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  ReuseTextField(
                                    controller: emailController,
                                    obscureText: false,
                                    linesMax: 1,
                                    linesMin: 1,
                                    color: MyColors.white,
                                    fontSize: 45.sp,
                                    radius: 25.sp,
                                    width: double.infinity,
                                    height: 175.h,
                                    iconTxt: Icons.email,
                                    iconSize: 40.sp,
                                    labelTxt: "example@gmail.com",
                                    maxHeight: 100.h,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => validateField(value, 'Email'),
                                  ),
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "fullName".tr,
                                      style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  ReuseTextField(
                                    controller: nameController,
                                    obscureText: false,
                                    linesMax: 1,
                                    linesMin: 1,
                                    color: MyColors.white,
                                    fontSize: 45.sp,
                                    radius: 25.sp,
                                    width: double.infinity,
                                    height: 175.h,
                                    iconTxt: Icons.person,
                                    iconSize: 40.sp,
                                    labelTxt: "Lingo",
                                    maxHeight: 100.h,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => validateField(value, 'Name'),
                                  ),
                                  SizedBox(height: 15.h),
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
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "password".tr,
                                      style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  ReuseTextField(
                                    controller: passwordController,
                                    obscureText: !isPasswordVisible.value,
                                    linesMax: 1,
                                    linesMin: 1,
                                    color: MyColors.white,
                                    fontSize: 45.sp,
                                    radius: 25.sp,
                                    width: double.infinity,
                                    height: 175.h,
                                    iconTxt: Icons.password,
                                    iconSize: 40.sp,
                                    labelTxt: "password".tr,
                                    maxHeight: 100.h,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => validateField(value, 'Password'),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        isPasswordVisible.value = !isPasswordVisible.value;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${"confirm".tr} ${"password".tr}",
                                      style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  ReuseTextField(
                                    obscureText: !isConfirmPasswordVisible.value,
                                    linesMax: 1,
                                    linesMin: 1,
                                    color: MyColors.white,
                                    fontSize: 45.sp,
                                    radius: 25.sp,
                                    width: double.infinity,
                                    height: 175.h,
                                    iconTxt: Icons.password,
                                    iconSize: 40.sp,
                                    labelTxt: "${"confirm".tr} ${"password".tr}",
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => validateField(value, 'Confirm Password'),
                                    maxHeight: 100.h,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("registerText".tr),
                                      TextButton(
                                          onPressed: () => {Get.toNamed(RouteName.loginPage)},
                                          style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                                          child: Text(
                                            "here".tr,
                                            style: TextStyle(decoration: TextDecoration.underline, decorationColor: MyColors.secondaryGreen, color: MyColors.secondaryGreen),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PrimaryBtn(
                                    btnText: "next".tr,
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: 150.h,
                                    isLoading: controllerRegis.isLoading.value,
                                    onClick: isFormValid.value
                                        ? () async {
                                            String? name = nameController.text;
                                            String? email = emailController.text;
                                            String? password = passwordController.text;

                                            String birth = datePickerController.text;
                                            var res = await controllerRegis.signUpAPI(name, email, password, birth);
                                            res?.fold((l) {
                                              showError(int.parse(l.message), "");
                                            }, (r) {
                                              controllerEmailVerif.emailVerification(email);

                                              Get.dialog(
                                                  barrierDismissible: false,
                                                  Obx(() => EmailAlert(
                                                        buttonText: controllerEmailVerif.istap.value == 1
                                                            ? "Wait ${controllerEmailVerif.countdown.value}s to resend" // Countdown
                                                            : "Resend", // Default text
                                                        title: "Email Verification",
                                                        message: "We've sent verification to your Email",
                                                        onClose: () {
                                                          Get.back();
                                                        },
                                                        imagePath: AssetConstraints.robotCool,
                                                        onPressed: () async {
                                                          if (controllerEmailVerif.istap.value == 0) {
                                                            await controllerEmailVerif.emailVerification(email);
                                                            controllerEmailVerif.istap.value = 1;
                                                            controllerEmailVerif.countdown.value = 30; // Set durasi countdown

                                                            for (int i = controllerEmailVerif.countdown.value; i > 0; i--) {
                                                              await Future.delayed(const Duration(seconds: 1));
                                                              controllerEmailVerif.countdown.value--;
                                                            }

                                                            controllerEmailVerif.istap.value = 0;
                                                          }
                                                        },
                                                      )));
                                            });
                                          }
                                        : null,
                                  )
                                ],
                              ),
                            ))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

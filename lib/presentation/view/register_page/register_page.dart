// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/error/errors.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
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
  final RxBool _isFormValid = false.obs;

  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _controllerRegis = Get.find<RegisterAPIController>();
  final _controllerEmailVerif = Get.find<EmailVerifController>();
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isConfirmPasswordVisible = false.obs;

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
            : (value != _passwordController.text)
                ? 'Passwords do not match'
                : null;
        break;
      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isFormValid.value =
          _emailController.text.contains('@') && _emailController.text.isNotEmpty && _nameController.text.isNotEmpty && _passwordController.text.isNotEmpty && _passwordController.text == value;
    });

    return error;
  }


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
                              "register".tr,
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
                                    controller: _emailController,
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
                                    controller: _nameController,
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
                                      controller: _datePickerController,
                                      labelTxt: "YYYY-MM-DD / Click the icon",
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
                                    controller: _passwordController,
                                    obscureText: !_isPasswordVisible.value,
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
                                        _isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        _isPasswordVisible.value = !_isPasswordVisible.value;
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
                                    obscureText: !_isConfirmPasswordVisible.value,
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
                                        _isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        _isConfirmPasswordVisible.value = !_isConfirmPasswordVisible.value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text.rich(
                                    TextSpan(text: "registerText".tr, style: TextStyle(color: Colors.black), children: [
                                      TextSpan(
                                        text: "here_text".tr,
                                        style: TextStyle(decoration: TextDecoration.underline, decorationColor: MyColors.primaryGreen, color: MyColors.primaryGreen, fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouteName.loginPage),
                                      )
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PrimaryBtn(
                                    btnText: "next".tr,
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: 150.h,
                                    isLoading: _controllerRegis.isLoading.value,
                                    onClick: _isFormValid.value
                                        ? () async {
                                            String? name = _nameController.text;
                                            String? email = _emailController.text;
                                            String? password = _passwordController.text;

                                            String birth = _datePickerController.text;
                                            var res = await _controllerRegis.signUpAPI(name, email, password, birth);
                                            res?.fold((l) {
                                              showError(int.parse(l.message), "");
                                            }, (r) {
                                              _controllerEmailVerif.emailVerification(email);

                                              Get.dialog(
                                                  barrierDismissible: false,
                                                  Obx(() => EmailAlert(
                                                        buttonText: _controllerEmailVerif.istap.value == 1
                                                            ? "${_controllerEmailVerif.countdown.value}s to resend" // Countdown
                                                            : "Resend", // Default text
                                                        title: "Email Verification",
                                                        message: "We've sent verification to your Email",
                                                        onClose: () {
                                                          Get.back();
                                                        },
                                                        imagePath: AssetConstraints.robotCool,
                                                        onPressed: () async {
                                                          if (_controllerEmailVerif.istap.value == 0) {
                                                            await _controllerEmailVerif.emailVerification(email);
                                                            _controllerEmailVerif.istap.value = 1;
                                                            _controllerEmailVerif.countdown.value = 30; // Set durasi countdown

                                                            for (int i = _controllerEmailVerif.countdown.value; i > 0; i--) {
                                                              await Future.delayed(const Duration(seconds: 1));
                                                              _controllerEmailVerif.countdown.value--;
                                                            }

                                                            _controllerEmailVerif.istap.value = 0;
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

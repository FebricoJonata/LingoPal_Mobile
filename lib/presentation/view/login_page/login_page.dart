// ignore_for_file: unused_element

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';
import '../../../core/color/color_const.dart';
import '../../../core/error/errors.dart';
import '../../controllers/register_page_controller/email_verif_controller.dart';
import '../components/localization.dart';
import '../components/primary_btn_reusable.dart';
import '../components/text_field_reusable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controllerLogin = Get.find<LoginAPIController>();
  var controllerEmailVerif = Get.find<EmailVerifController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final RxBool _isFormValid = false.obs;
  final RxBool _isPasswordVisible = false.obs;
  // var controllerCourse = Get.find<CourseController>();
  String? _validateField(String? value, String fieldType) {
    String? error;
    switch (fieldType) {
      case 'Email':
        error = (value == null || !value.contains('@')) ? 'Email must contain "@"' : null;
        break;

      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isFormValid.value = ((_emailController.text.contains('@') && _emailController.text.isNotEmpty) && _passController.text.isNotEmpty);
    });

    return error;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          width: 1179.w,
          height: 2700.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetConstraints.bgAppLogo),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: _buildLanguageButton(),
              // ),
              Flexible(
                child: Container(
                  width: 1179.w,
                  height: 1500.h,
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      SizedBox(
                        width: 1179.w,
                        height: 140.h,
                        child:
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            Text(
                          "login".tr,
                          style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                        ),
                        // _buildLanguageButton(),
                        // ],
                        // )
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxHeight: 100.h,
                        validator: (value) => _validateField(value, 'Email'),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "password".tr,
                          style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Obx(() => ReuseTextField(
                            controller: _passController,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                _isPasswordVisible.value = !_isPasswordVisible.value;
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(
                        TextSpan(
                            text: "loginText".tr,
                            // style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "here_text".tr,
                                style: const TextStyle(decoration: TextDecoration.underline, decorationColor: MyColors.primaryGreen, color: MyColors.primaryGreen, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouteName.registerPage),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => PrimaryBtn(
                            btnText: "Login",
                            width: MediaQuery.of(context).size.width / 2,
                            height: 150.h,
                            isLoading: controllerLogin.isLoading.value,
                            onClick: _isFormValid.value == true
                                ? () async {
                                    String? email = _emailController.text;
                                    String? pass = _passController.text;
                                    var res = await controllerLogin.loginAPI(email, pass);
                                    res?.fold((l) {
                                      showError(int.parse(l.message), "");
                                      if (l.message == "422") {
                                        controllerEmailVerif.emailVerification(email);
                                      }
                                    }, (r) {});
                                    // Get.toNamed(RouteName.basePage);
                                  }
                                : null,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLanguageButton() {
  return InkWell(
    onTap: () {
      String newLanguage = TranslationService.currentLang.value == 'Indonesia' ? 'English' : 'Indonesia';
      TranslationService.changeLocale(newLanguage);
    },
    child: Obx(() {
      bool isSelected = TranslationService.currentLang.value == 'Indonesia';
      return CircleAvatar(
        radius: 70.w,
        backgroundImage: AssetImage(
          isSelected ? AssetConstraints.indoflag : AssetConstraints.englishFlag,
        ),
      );
    }),
  );
}

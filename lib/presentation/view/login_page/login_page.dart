import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';
import '../../../core/color/color_constraint.dart';
import '../../../core/error/errors.dart';
import '../../controllers/register_page_controller/email_verif_controller.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final RxBool isFormValid = false.obs;

  // var controllerCourse = Get.find<CourseController>();
  String? validateField(String? value, String fieldType) {
    String? error;
    switch (fieldType) {
      case 'Email':
        error = (value == null || !value.contains('@')) ? 'Email must contain "@"' : null;
        break;

      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFormValid.value = ((emailController.text.contains('@') && emailController.text.isNotEmpty) && passController.text.isNotEmpty);
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
            children: [
              Image.asset(AssetConstraints.bgAppLogo),
              Flexible(
                child: Container(
                  width: 1179.w,
                  height: 1500.h,
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300.h,
                      ),
                      SizedBox(
                          width: 1179.w,
                          height: 140.h,
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                          )),
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
                        labelTxt: "",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxHeight: 100.h,
                        validator: (value) => validateField(value, 'Email'),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ReuseTextField(
                        controller: passController,
                        obscureText: true,
                        linesMax: 1,
                        linesMin: 1,
                        color: MyColors.white,
                        fontSize: 45.sp,
                        radius: 25.sp,
                        width: double.infinity,
                        height: 175.h,
                        iconTxt: Icons.password,
                        iconSize: 40.sp,
                        labelTxt: "Password",
                        maxHeight: 100.h,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 1179.w,
                        height: 100.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New here? Register your account "),
                            TextButton(
                                onPressed: () => {Get.toNamed(RouteName.registerPage)},
                                style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                                child: const Text(
                                  "here",
                                  style: TextStyle(decoration: TextDecoration.underline, decorationColor: MyColors.secondaryGreen, color: MyColors.secondaryGreen),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => PrimaryBtn(
                            btnText: "Login",
                            width: MediaQuery.of(context).size.width / 2,
                            height: 150.h,
                            isLoading: controllerLogin.isLoading.value,
                            onClick: isFormValid.value == true
                                ? () async {
                                    String? email = emailController.text;
                                    String? pass = passController.text;
                                    var res = await controllerLogin.loginAPI(email, pass);
                                    res?.fold((l) {
                                      showError(int.parse(l.message), "");
                                      controllerEmailVerif.emailVerification(email);
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

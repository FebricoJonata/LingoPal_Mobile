import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
// import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import '../../../core/color/color_constraint.dart';
import '../components/primary_btn_reusable.dart';
import '../components/text_field_reusable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controllerLogin = Get.find<LoginAPIController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // var controllerCourse = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: SizedBox(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackBtn(),
                          SizedBox(
                            width: 80.w,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
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
                      controller: emailController..text = "riko9647@gmail.com",
                      obscureText: false,
                      linesMax: 1,
                      linesMin: 1,
                      color: MyColors.white,
                      fontSize: 45.sp,
                      radius: 25.sp,
                      width: double.infinity,
                      iconTxt: Icons.email,
                      iconSize: 40.sp,
                      labelTxt: "",
                      maxHeight: 100.h,
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
                      controller: passController..text = "string",
                      obscureText: true,
                      linesMax: 1,
                      linesMin: 1,
                      color: MyColors.white,
                      fontSize: 45.sp,
                      radius: 25.sp,
                      width: double.infinity,
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
                              onPressed: () => {Navigator.pushNamed(context, '/register')},
                              style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                              child: const Text(
                                "here",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: MyColors.secondaryGreen,
                                    color: MyColors.secondaryGreen),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryBtn(
                      btnText: "Login",
                      width: MediaQuery.of(context).size.width / 2,
                      height: 150.h,
                      onClick: () {
                        String? email = emailController.text;
                        String? pass = passController.text;
                        // controllerCourse.getCourses();
                        // controllerCourse.getUserCourseProgress();
                        controllerLogin.loginAPI(email, pass);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

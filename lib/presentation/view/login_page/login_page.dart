import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryYellow,
      body: Column(
        children: [
          Image.asset(AssetConstraints.bgAppLogo),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Column( 
                children: [
                  SizedBox(
                    height: 300.h,
                    // child: Container(color: Colors.green,),
                  ),
                  Row(
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
                        "Sign In",
                        style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w900),
                      )
                    ],
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
                    controller: emailController,
                    obscureText: false,
                    linesMax: 1,
                    linesMin: 1,
                    color: MyColors.white,
                    fontSize: 45.sp,
                    radius: 25.sp,
                    width: double.infinity,
                    iconTxt: Icons.email,
                    iconSize: 40.sp,
                    labelTxt: "Email",
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
                    controller: passController,
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
                  Row(
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
                      controllerLogin.loginAPI(email, pass);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

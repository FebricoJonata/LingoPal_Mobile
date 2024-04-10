import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color/color_constraint.dart';
import '../../Components/primary_btn_reusable.dart';
import '../../Components/text_field_reusable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: MyColors.secondaryYellow,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            const Row(
              children: [Text("Sign In")],
            ),
            ReuseTextField(
              linesMax: 1,
              linesMin: 1,
              color: MyColors.white,
              fontSize: 40.sp,
              radius: 25.sp,
              width: double.infinity,
              iconTxt: Icons.email,
              iconSize: 40.sp,
              labelTxt: "Email",
              maxHeight: 150.h,
            ),
            const SizedBox(height: 20),
            ReuseTextField(
              linesMax: 1,
              linesMin: 1,
              color: MyColors.white,
              fontSize: 40.sp,
              radius: 25.sp,
              width: double.infinity,
              iconTxt: Icons.password,
              iconSize: 40.sp,
              labelTxt: "Password",
              maxHeight: 150.h,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New here? Register your account "),
                TextButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/register')},
                    style: TextButton.styleFrom(
                        minimumSize: Size.zero, padding: EdgeInsets.zero),
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
              onClick: () => {Navigator.pushReplacementNamed(context, '/home')},
            ),
          ],
        ),
      ),
    );
  }
}

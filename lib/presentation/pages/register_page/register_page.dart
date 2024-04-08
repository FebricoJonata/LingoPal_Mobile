import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/Components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/Components/text_field_reusable.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: MyColors.primaryYellow,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            const Row(
              children: [Text("Sign Up")],
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
              iconTxt: Icons.person,
              iconSize: 40.sp,
              labelTxt: "Name",
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
              iconTxt: Icons.phone,
              iconSize: 40.sp,
              labelTxt: "Phone Number",
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
              labelTxt: "Password Confirmation",
              maxHeight: 150.h,
            ),
            // buat ke login
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? Login "),
                TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/login')}, 
                  style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                  child: const Text(
                    "here", 
                    style: TextStyle(
                      decoration: TextDecoration.underline, 
                      decorationColor: MyColors.secondaryGreen, 
                      color: MyColors.secondaryGreen
                    ),
                  )
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryBtn(
              btnText: "Register",
              width: MediaQuery.of(context).size.width / 2,
              height: 150.h,
              onClick: () => {Navigator.pushNamed(context, '/home')},
            ),
          ],
        ),
      ),
    );
  }
}

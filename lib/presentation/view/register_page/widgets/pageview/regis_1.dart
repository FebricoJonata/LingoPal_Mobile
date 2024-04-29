import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/page_view_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/widgets/choice_chip/choice_chip.dart';

class Regis1 extends StatelessWidget {
  const Regis1({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerPageView = Get.find<PageViewRegisController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          ReuseTextField(
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
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Name",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          ReuseTextField(
            obscureText: false,
            linesMax: 1,
            linesMin: 1,
            color: MyColors.white,
            fontSize: 45.sp,
            radius: 25.sp,
            width: double.infinity,
            iconTxt: Icons.person,
            iconSize: 40.sp,
            labelTxt: "Name",
            maxHeight: 100.h,
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Phone Number",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          ReuseTextField(
            obscureText: false,
            linesMax: 1,
            linesMin: 1,
            color: MyColors.white,
            fontSize: 45.sp,
            radius: 25.sp,
            width: double.infinity,
            iconTxt: Icons.phone,
            iconSize: 40.sp,
            labelTxt: "Phone Number",
            maxHeight: 100.h,
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Birth Day",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),

          DatePicker(
              labelTxt: "BirtDay",
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
              "Gender",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Container(width: 1179.w, height: 150.h, child: choiChip()),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),

          ReuseTextField(
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
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Confirm Password",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          ReuseTextField(
            obscureText: true,
            linesMax: 1,
            linesMin: 1,
            color: MyColors.white,
            fontSize: 45.sp,
            radius: 25.sp,
            width: double.infinity,
            iconTxt: Icons.password,
            iconSize: 40.sp,
            labelTxt: "Password Confirmation",
            maxHeight: 100.h,
          ),

          // buat ke login
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? Login "),
              TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/login')},
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
            btnText: "Lanjutkan",
            width: MediaQuery.of(context).size.width / 2,
            height: 150.h,
            onClick: () => {
              if (controllerPageView.currentPageIndex == 0)
                {
                  controllerPageView.onChangePage1(),
                }
            },
          ),
        ],
      ),
    );
  }
}

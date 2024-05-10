import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

import 'package:lingo_pal_mobile/routes/name_page.dart';

class Regis2 extends StatelessWidget {
  const Regis2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1179.w,
          height: 100.h,
          child: const Text(
            "Apakah anda terbiasa berbicara dalam bahasa Inggris?",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        // Container(width: 1179.w, height: 150.h, child: choiChip()),
        Container(
          width: 1179.w,
          height: 100.h,
          child: const Text(
            "Seberapa lancar Anda dalam menulis dalam bahasa Inggris?",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        PrimaryBtn(
          btnText: "Submit",
          width: 200.w,
          height: 50.h,
          onClick: () {
            Get.toNamed(RouteName.loginPage);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/register_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/choice_chip.dart';
import 'package:lingo_pal_mobile/presentation/view/components/date_picker.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/components/text_field_reusable.dart';

class Regis1 extends StatelessWidget {
  Regis1({super.key});

  final RxBool isFormValid = false.obs;

  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controllerRegis = Get.find<RegisterAPIController>();
  final controllerChoiceChip = Get.find<ChoicesController>();

  final List<Choices> pageChoices = [
    Choices(1, "Male", false),
    Choices(2, "Female", false),
  ];

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
        error = (value == null || value.length < 12 || value.length > 15) ? 'Phone number must be between 12 and 15 digits' : null;
        break;
      default:
        error = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFormValid.value =
          (emailController.text.contains('@') && emailController.text.isNotEmpty) && nameController.text.isNotEmpty && (phoneController.text.length >= 12 && phoneController.text.length <= 15);
    });

    return error;
  }

  @override
  Widget build(BuildContext context) {
    controllerChoiceChip.setChoices(pageChoices);
    return SingleChildScrollView(
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
            iconTxt: Icons.email,
            iconSize: 40.sp,
            labelTxt: "Email",
            maxHeight: 100.h,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateField(value, 'Email'),
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
            controller: nameController,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateField(value, 'Name'),
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
            controller: phoneController,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateField(value, 'Phone Number'),
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
              controller: datePickerController,
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
          SizedBox(
              width: 1179.w,
              height: 150.h,
              child: ReusableChoiceChip(
                onSelect: (value) {},
              )),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
            ),
          ),
          ReuseTextField(
            controller: passwordController,
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
                    style: TextStyle(decoration: TextDecoration.underline, decorationColor: MyColors.secondaryGreen, color: MyColors.secondaryGreen),
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
            onClick: isFormValid.value
                ? () {
                    String? name = nameController.text;
                    String? email = emailController.text;
                    String? password = passwordController.text;
                    String? phoneNumber = phoneController.text;
                    String birth = datePickerController.text;
                    controllerRegis.signUpAPI(name, email, password, phoneNumber, birth, controllerChoiceChip.selectedChoice.value?.label ?? "");
                  }
                : null,
          ),
        ],
      ),
    ));
  }
}

// ignore_for_file: must_be_immutable, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/choice_chip_controller.dart';

class choiChip extends StatelessWidget {
  choiChip({super.key});
  var controller = Get.find<ChoiceController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoiceController>(builder: (controller) {
      return Container(
        // margin: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20.w,
              children: controller.choices
                  .map((choice) => ChoiceChip(
                        backgroundColor: controller.selectedChoice.value?.id == choice.id
                            ? MyColors.primaryGreen
                            : MyColors.primaryYellow,
                        selectedColor: controller.selectedChoice.value?.id == choice.id
                            ? MyColors.primaryGreen
                            : MyColors.primaryYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.h),
                          side: controller.selectedChoice.value?.id == choice.id
                              ? BorderSide.none
                              : const BorderSide(color: Colors.transparent),
                        ),
                        showCheckmark: false,
                        label: Text(
                          choice.label,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 35.sp,
                            color:
                                controller.selectedChoice.value?.id == choice.id ? Colors.white : MyColors.primaryGreen,
                          ),
                        ),
                        selected: controller.selectedChoice.value?.id == choice.id,
                        onSelected: (selected) {
                          controller.onSelected(choice);
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      );
    });
  }
}

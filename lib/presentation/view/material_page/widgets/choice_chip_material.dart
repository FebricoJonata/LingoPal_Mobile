// ignore_for_file: must_be_immutable, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/choice_chip_material_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/material_API_controller.dart';

class ChoiceChipMaterial extends StatelessWidget {
  ChoiceChipMaterial({super.key});
  var controller = Get.find<ChoiceMaterialController>();
  var controllerMaterial = Get.find<MaterialController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoiceMaterialController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 20.w,
            children: controller.choices
                .map((choice) => ChoiceChip(
                      backgroundColor: controller.selectedChoice.value?.id == choice.id ? MyColors.primaryGreen : MyColors.primaryYellow,
                      selectedColor: controller.selectedChoice.value?.id == choice.id ? MyColors.primaryGreen : MyColors.primaryYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.h),
                        side: controller.selectedChoice.value?.id == choice.id ? BorderSide.none : const BorderSide(color: Colors.transparent),
                      ),
                      showCheckmark: false,
                      label: Text(
                        choice.label,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 35.sp,
                          color: controller.selectedChoice.value?.id == choice.id ? Colors.white : MyColors.primaryGreen,
                        ),
                      ),
                      selected: controller.selectedChoice.value?.id == choice.id,
                      onSelected: (selected) {
                        controller.onSelected(choice);
                        print(choice.label);
                        controllerMaterial.getMaterials(choice.label, "");
                      },
                    ))
                .toList(),
          )
        ],
      );
    });
  }
}

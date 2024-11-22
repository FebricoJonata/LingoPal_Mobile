import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/material_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/searchbar_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/choice_chip.dart';
import 'package:lingo_pal_mobile/presentation/view/components/search_bar_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/widgets/material_card.dart';

class MaterialPage extends StatefulWidget {
  const MaterialPage({super.key});

  @override
  State<MaterialPage> createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  RxString searches = "".obs;

  var controllerMaterial = Get.find<MaterialController>();
  final controller = Get.find<ChoicesController>();
  final controllerSearch = Get.find<SearchBarController>();

  @override
  void initState() {
    super.initState();

    // // Periksa apakah pilihan sudah ada
    // if (controller.choices.isEmpty) {
    //   final List<Choices> pageChoices = [
    //     Choices(1, "All", true),
    //     Choices(2, "Article", false),
    //     Choices(3, "Video", false),
    //   ];
    //   controller.setChoices(pageChoices);
    // }

    // Pastikan pencarian hanya dijalankan jika diperlukan
    if (controllerMaterial.materials.value == null) {
      controllerSearch.searches.value = "";
      controllerMaterial.getMaterials(controller.selectedChoice.value!.label, controllerSearch.searches.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        // padding: EdgeInsets.fromLTRB(0, 0, 0, 200.h),
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseSearchBar(
                      // searches: searches,
                      onPressed: (value) {
                        controllerMaterial.getMaterials(controller.selectedChoice.value!.label, controllerSearch.searches.value);
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text("Material", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ReusableChoiceChip(
                        onSelect: (value) {
                          controllerMaterial.getMaterials(controller.selectedChoice.value!.label, controllerSearch.searches.value);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Obx(() {
                        var materials = controllerMaterial.materials.value?.body ?? [];

                        if (controllerMaterial.materials.value == null || controllerMaterial.isLoading.isTrue) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Container(
                                child: const Text("Loading ..."),
                                alignment: Alignment.center,
                              ),
                            ],
                          );
                        } else if (controllerMaterial.errorMessage.isNotEmpty) {
                          return Text(controllerMaterial.errorMessage.value);
                        } else if (materials.isEmpty) {
                          return Column(
                            children: [
                              const Text("Material not found"),
                              SizedBox(height: 50.h),
                              const Text("This could be due to a mistake in your search or the material may not exist"),
                            ],
                          );
                        } else {
                          return RefreshIndicator(
                            color: MyColors.primaryGreen,
                            onRefresh: () async {
                              await controllerMaterial.getMaterials(controller.selectedChoice.value!.label, controllerSearch.searches.value);
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 300.h),
                              shrinkWrap: true,
                              itemCount: materials.length,
                              itemBuilder: (context, index) {
                                return MaterialCard(material: materials[index]);
                              },
                              separatorBuilder: (context, index) => SizedBox(height: 50.h),
                            ),
                          );
                        }
                      }),
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

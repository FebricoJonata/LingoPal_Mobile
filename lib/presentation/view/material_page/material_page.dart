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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controllerSearch.setSearchWord("");
        // Pastikan pencarian hanya dijalankan jika diperlukan
        if (controllerMaterial.materials.value == null) {
          controllerMaterial.getMaterials(controller.selectedChoice.value?.value, "");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // controllerSearch.searches.value = "";
    if(searches.value==""){
      print("set keyword back to null");
      controllerMaterial.getMaterials("All", "");
    }
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseSearchBar(
                      // searches: searches,
                      onPressed: (value) {
                        controllerMaterial.getMaterials(controller.selectedChoice.value!.value, controllerSearch.searches.value);
                      },
                    ),
                    const SizedBox(height: 24),
                    Text("material".tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ReusableChoiceChip(
                        onSelect: (value) {
                          print("masuk componen choice chip");
                          controllerMaterial.getMaterials(controller.selectedChoice.value!.value, controllerSearch.searches.value);
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
                                alignment: Alignment.center,
                                child: Text("loading".tr),
                              ),
                            ],
                          );
                        } else if (controllerMaterial.errorMessage.isNotEmpty) {
                          return Text(controllerMaterial.errorMessage.value);
                        } else if (materials.isEmpty) {
                          return Column(
                            children: [
                              Text("material_not_found".tr),
                              SizedBox(height: 50.h),
                              Text("source_not_found".tr, textAlign: TextAlign.center,),
                            ],
                          );
                        } else {
                          return RefreshIndicator(
                            color: MyColors.primaryGreen,
                            onRefresh: () async {
                              await controllerMaterial.getMaterials(controller.selectedChoice.value!.value, controllerSearch.searches.value);
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

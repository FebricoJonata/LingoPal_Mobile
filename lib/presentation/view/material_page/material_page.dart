import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/choice_chip_material_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/material_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/search_bar_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/widgets/choice_chip_material.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/widgets/material_card.dart';

class MaterialPage extends StatefulWidget {
  const MaterialPage({super.key});

  @override
  State<MaterialPage> createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {

  
  String searches = "";

  void _setSearchMaterial(searchMaterial){
    setState(() {
      searches = searchMaterial;
    });
  }

  List<String>filters = ["All", "Article", "Video"];
  String selected = "All";

  var controllerChoice = Get.find<ChoiceMaterialController>();
  var controllerMaterial = Get.find<MaterialController>();

  List<MaterialContent>materials = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 200.h),
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 100.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseSearchBar(setSearchMethod: _setSearchMaterial, searchWord: searches,),
                    const SizedBox(height: 24),
                    Text("Material", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 90.h,
                      child: ChoiceChipMaterial(), 
                    ),
                    SizedBox(height: 20,),
                    GetBuilder<MaterialController>(
                      builder: (controllerMaterial) {
                        return FutureBuilder(
                          future: controllerMaterial.getMaterials(), 
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Text("Memuat data ...");
                            }
                            else if(snapshot.hasError){
                              return Text("Error karena ${snapshot.error}");
                            }
                            else if (!snapshot.hasData){
                              return Text("Data kosong");
                            }
                            else {
                              var materials = controllerMaterial.materials.value!.body ?? [];
                              return Expanded(
                                // list nya ambil parameter dari controllerChoice.selectedChoice.value?.label ?? "All",
                                child: ListView.separated(
                                  itemCount: materials.length,
                                  itemBuilder: (context, index) {
                                    return MaterialCard(material: materials[index]);
                                  }, 
                                  separatorBuilder: (context, index) => SizedBox(height: 50.h,), 
                                )
                              );
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            ])));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/search_bar_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/material_card.dart';

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

  List<String>filters = ["All", "Text", "Video"];
  String selected = "All";

  List<MaterialContent>materials = [
    MaterialContent("A poem about poets", "Video", "Literature", "British Council", "https://img.youtube.com/vi/a41G-6o9Pzs/0.jpg", "https://youtu.be/a41G-6o9Pzs", "Do you like poetry? In this video you can listen to a poem … about some of the world's best poets!"),

    MaterialContent("Amazing adventurers", "Text", "Travel", "British Council", "https://learnenglishteens.britishcouncil.org/sites/teens/files/styles/section_block_landing_image/public/field/image/rs7040_thinkstockphotos-490580355-low_4.jpg?itok=OxwLgZDf", "Ed Stafford from the UK is the first person to walk along the Amazon River from the mountains of Peru to the mouth of the river in Brazil. His amazing journey took two years and four months. There are many dangerous animals in the rainforest, like snakes and crocodiles, but Ed was lucky; he was only bitten by ants and mosquitoes. On his trip, Ed had to find fruit and nuts or catch fish each morning. Sometimes food was hard to find and Ed was often tired and hungry.", "From climbing Everest to skiing to the South Pole, read about some amazing adventurers!")
  ];

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
                  children: [
                    ReuseSearchBar(setSearchMethod: _setSearchMaterial, searchWord: searches,),
                    const SizedBox(height: 24),
                    Text("Material", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 80.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            label: SizedBox(child: Text(filters[index])),
                            labelStyle: TextStyle(fontSize: 36.sp),
                            backgroundColor: MyColors.primaryYellow,
                            // padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
                            selected: selected == filters[index],
                            onSelected: (bool isSelected){
                              setState(() {
                                selected = isSelected? filters[index] : "";
                                // material tipe teks dan video akan dibarengin fetchnya, cth: setelah teks index 0 lalu video index 0
                              });
                            },
                          );
                        }, 
                        separatorBuilder: (context, index) => SizedBox(width: 20,),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return MaterialCard(material: materials[index]);
                        }, 
                        separatorBuilder: (context, index) => SizedBox(height: 50.h,), 
                      )
                    )
                  ],
                ),
              ),
            ),
            ])));
  }
}

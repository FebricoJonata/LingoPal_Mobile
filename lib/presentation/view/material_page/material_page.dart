import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return MaterialCard();
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

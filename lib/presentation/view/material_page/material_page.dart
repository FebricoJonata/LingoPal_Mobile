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

  void _setSearchWord(searchMaterial){
    setState(() {
      searches = searchMaterial;
    });
  }

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
                    ReuseSearchBar(setSearchMethod: _setSearchWord, searchWord: searches,),
                    const SizedBox(height: 24),
                    Text("Material", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    const SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return MaterialCard();
                      }, 
                      separatorBuilder: (context, index) => SizedBox(height: 50.h,),
                    )
                  ],
                ),
              ),
            ),
    ])));
  }
}

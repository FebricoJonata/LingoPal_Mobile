// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/searchbar_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class ReuseSearchBar extends StatelessWidget {
  ReuseSearchBar({super.key, required this.onPressed});

  Function(String) onPressed;

  SearchController searchController = SearchController();
  SearchBarController searchBarController = Get.find<SearchBarController>();

  void searching(value){
    print("Ini text dari controller ${searchBarController.searches.value}");
    print("Ini text dari searchbar $value");
    if (value.isNotEmpty) {
      searchBarController.setSearchWord(value);
      onPressed(searchBarController.searches.value);
    }
  }

  @override
  Widget build(BuildContext context) {

    if(searchBarController.searches.value.isNotEmpty){
      searchController.text = searchBarController.searches.value;
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150.h,
      child: Row(
        children: [
          Expanded(
            child: Row( 
              children: [
                Obx(() {
                  return Expanded(
                  child: SearchBar(
                    controller: searchBarController.searches.value.isEmpty?searchController : searchController..text = searchBarController.searches.value,
                    hintText: "Type keywords ...",
                    leading: const Icon(Icons.search),
                    elevation: const WidgetStatePropertyAll(0),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                    surfaceTintColor: const WidgetStatePropertyAll(MyColors.white),
                    backgroundColor: const WidgetStatePropertyAll(MyColors.white),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onSubmitted: searching,
                  ),
                );
                },),
                
                Obx(() {
                  // searchBarController.searches.value = searchController.text;
                  if(searchBarController.searches.value.isNotEmpty){
                    return IconButton(
                    onPressed: () {
                      searchController.clear();
                      searchBarController.setSearchWord("");
                      onPressed(searchBarController.searches.value);
                    },
                    icon: const Icon(Icons.close));
                  }
                        
                  else {
                    return const SizedBox(
                      width: 8,
                    );
                  }
                })
              ],
            ),
          ),
          PrimaryBtn(
            btnText: "Search",
            width: 180.w,
            height: context.height,
            onClick: () {
              searching(searchController.text);
            },
          )
        ],
          
      )
    );
    
  }
}

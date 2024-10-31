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
  // RxString searches;

  SearchController searchController = SearchController();
  SearchBarController searchBarController = Get.find<SearchBarController>();

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: SearchBar(
                    controller: searchController,
                    hintText: "Search ...",
                    leading: const Icon(Icons.search),
                    elevation: const WidgetStatePropertyAll(0),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                    surfaceTintColor: const WidgetStatePropertyAll(MyColors.white),
                    backgroundColor: const WidgetStatePropertyAll(MyColors.white),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Obx(() {
                  searchBarController.searches.value = searchController.text;
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
              print("Ini text dari controller ${searchBarController.searches.value}");
              print("Ini text dari searchbar ${searchController.text}");
              if (searchController.text.isNotEmpty) {
                // setSearchMethod(searchController.text);
                searchBarController.setSearchWord(searchController.text);
                onPressed(searchBarController.searches.value);
              }
            },
          )
        ],
          
      )
    );
    // });
    
  }
}

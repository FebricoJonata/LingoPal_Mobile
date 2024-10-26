// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/material_page.dart';

class ReuseSearchBar extends StatefulWidget {
  ReuseSearchBar({super.key, required this.setSearchMethod, required this.searchWord});

  Function setSearchMethod;
  String searchWord;

  @override
  State<ReuseSearchBar> createState() => _ReuseSearchBarState();
}

class _ReuseSearchBarState extends State<ReuseSearchBar> {
  SearchController searchController = SearchController();

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
          // Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
          Expanded(
            child: SearchBar(
              controller: searchController..text = widget.searchWord,
              hintText: "Type keywords ...",
              leading: Icon(Icons.search),
              elevation: WidgetStatePropertyAll(0),
              padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(horizontal: 8)),
              surfaceTintColor: WidgetStatePropertyAll(MyColors.white),
              backgroundColor: WidgetStatePropertyAll(MyColors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Builder(builder: (context) {
            if (searchController.text != "") {
              return IconButton(
                  onPressed: () {
                    widget.setSearchMethod("");
                  },
                  icon: const Icon(Icons.close));
            } else {
              return const SizedBox(
                width: 8,
              );
            }
          }),
          PrimaryBtn(
            btnText: "Search",
            width: 180.w,
            height: context.height,
            onClick: () {

              print(searchController.text);
              if (searchController.text != "") {
                widget.setSearchMethod(searchController.text);
                
              }
            },
          )
        ],
      ),
    );
  }
}

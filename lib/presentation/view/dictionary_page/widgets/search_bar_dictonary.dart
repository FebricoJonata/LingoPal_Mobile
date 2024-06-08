// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class SearchBarDictionary extends StatefulWidget {
  SearchBarDictionary({super.key, required this.setSearchMethod});

  Function setSearchMethod;

  @override
  State<SearchBarDictionary> createState() => _SearchBarDictionaryState();
}

class _SearchBarDictionaryState extends State<SearchBarDictionary> {
  SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
          Expanded(
            child: SearchBar(
              controller: searchController,
              hintText: "Search for words...",
              leading: Icon(Icons.search),
              elevation: MaterialStatePropertyAll(0),
              padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 8)),
              surfaceTintColor: MaterialStatePropertyAll(MyColors.white),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Builder(builder: (context) {
            if (searchController.text != "") {
              return IconButton(
                  onPressed: () {
                    searchController.text = "";
                    widget.setSearchMethod(searchController.text);
                  },
                  icon: Icon(Icons.close));
            } else {
              return SizedBox(
                width: 8,
              );
            }
          }),
          PrimaryBtn(
            btnText: "Search",
            width: 180.w,
            height: 150.h,
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

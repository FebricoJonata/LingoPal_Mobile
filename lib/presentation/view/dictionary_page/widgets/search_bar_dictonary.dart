import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

class SearchBarDictonary extends StatelessWidget {
  SearchBarDictonary({super.key, required this.setSearch});

  Function setSearch;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SearchBar(
      controller: searchController,
      hintText: "Search for words...",
      leading: Icon(Icons.search),
      elevation: MaterialStatePropertyAll(0),
      padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 10)),
      surfaceTintColor: MaterialStatePropertyAll(MyColors.white),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      onSubmitted: (value) {
        print(value);
        setSearch(value);
      }, 
    );

    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 10),
    //   decoration: BoxDecoration(
    //     color: MyColors.white,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Row(
    //     children: [
    //       Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
    //       Expanded(
    //         child: TextField(
    //           decoration: InputDecoration(
    //             hintText: 'Search for words...',
    //             border: InputBorder.none,
    //             contentPadding: EdgeInsets.symmetric(vertical: 12),
    //           ),
    //           controller: searchController,
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.close)),
    //       PrimaryBtn(btnText: "Search", width: 150.w, height: 80.h)
    //     ],
    //   ),
    // );
  }
}

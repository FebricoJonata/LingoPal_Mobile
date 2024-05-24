import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class WordCard extends StatefulWidget {
  WordCard({super.key, required this.searchWord});

  String searchWord;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {

  @override
  Widget build(BuildContext context) {
    String search = widget.searchWord;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp),
              color: MyColors.primaryGreen, 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(search, style: TextStyle(color: MyColors.secondaryYellow, fontSize: 60.sp, fontWeight: FontWeight.bold),),
                SizedBox(height: 50.h,),
                Text("(determiner)", style: TextStyle(color: MyColors.primaryYellow),),
                SizedBox(height: 50.h,),
                Text("Meaning Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", softWrap: true,
                style: TextStyle(color: MyColors.white),)
              ],
            ),
          ),
          Text("Example"),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", softWrap: true,),
          Wrap(
            children: [
              Text("Synonyms"),
              Text("Synonym 1"), Text("Synonym 1"), Text("Synonym 1"), Text("Synonym 1")
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text("Antonyms"),
              Text("Antonym 1"), Text("Antonym 1"), Text("Antonym 1"), Text("Antonym 1")
            ],
          ),
        ],
      ),
    );
  }
}
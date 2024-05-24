import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/search_bar_dictonary.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/word_list.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {

  String searchWord = "";

  void setSearchWord(search){
    setState(() {
      searchWord = search;
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
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Expanded(
                child: Column(
                  children: [
                    SearchBarDictonary(setSearch: setSearchWord,),
                    const SizedBox(height: 24),
                    if(searchWord=="")
                      WordList()
                    else
                      Text(searchWord)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

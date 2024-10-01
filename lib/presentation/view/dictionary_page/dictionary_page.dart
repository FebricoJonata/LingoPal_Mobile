import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/search_bar_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/word_card.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/word_list.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {

  String searches = "";

  void _setSearchWord(searchWord){
    setState(() {
      searches = searchWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    print("Searches: $searches");
    print("Search method: $_setSearchWord");
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
                    if(searches=="")
                      Expanded(child: WordList(onSearch: _setSearchWord))
                    else 
                      Expanded(child: WordCard(searchWord: searches,))
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

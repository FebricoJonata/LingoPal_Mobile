import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/search_bar_dictonary.dart';
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
    // Dummy Data
    List<Map<String, String>> vocabulary = [
      {'word': 'a / an', 'type': 'determiner'},
      {'word': 'ability', 'type': 'noun'},
      {'word': 'able', 'type': 'adjective'},
      {'word': 'about', 'type': 'adverb / preposition'},
    ];

    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 250.h),
                child: Column(
                  children: [
                    SearchBarDictionary(setSearchMethod: _setSearchWord,),
                    const SizedBox(height: 24),
                    
                    // VocabularyContainer(header: "A", vocabulary: vocabulary),
                    // VocabularyContainer(header: "B", vocabulary: vocabulary),
                    // VocabularyContainer(header: "C", vocabulary: vocabulary),
                    if(searches=="")
                      Expanded(child: WordList())
                    else
                      Text(searches)
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

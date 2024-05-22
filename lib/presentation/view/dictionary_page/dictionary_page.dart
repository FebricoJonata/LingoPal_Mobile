import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/search_bar_dictonary.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    children: [
                      const SearchBarDictonary(),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Text(
                            "Glossary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Icon(Icons.list),
                        ],
                      ),
                      const SizedBox(height: 20),
                      VocabularyContainer(header: "A", vocabulary: vocabulary),
                      VocabularyContainer(header: "B", vocabulary: vocabulary),
                      VocabularyContainer(header: "C", vocabulary: vocabulary),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {

    // Dummy Data
    List<Map<String, String>> vocabulary = [
      {'word': 'a / an', 'type': 'determiner'},
      {'word': 'ability', 'type': 'noun'},
      {'word': 'able', 'type': 'adjective'},
      {'word': 'about', 'type': 'adverb / preposition'},
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(
                      children: [
                        Text(
                          "Glossary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        // Spacer(),
                        // Icon(Icons.list),
                      ],
                    ),
                    const SizedBox(height: 20),
          VocabularyContainer(header: "A", vocabulary: vocabulary),
          VocabularyContainer(header: "B", vocabulary: vocabulary),
          VocabularyContainer(header: "C", vocabulary: vocabulary),
        ],
      ),
    );
  }
}
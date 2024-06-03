import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {

    // Dummy Data
    List<Map<String, String>> vocabularyA = [
      {'word': 'a / an', 'type': 'determiner'},
      {'word': 'ability', 'type': 'noun'},
      {'word': 'able', 'type': 'adjective'},
      {'word': 'about', 'type': 'adverb / preposition'},
    ];

    List<Map<String, String>> vocabularyB = [
      {'word': 'back', 'type': 'noun'},
      {'word': 'bad', 'type': 'adjective'},
      {'word': 'bounce', 'type': 'verb'},
      {'word': 'bump', 'type': 'noun'},
    ];

    List<Map<String, String>> vocabularyC = [
      {'word': 'can', 'type': 'noun'},
      {'word': 'come', 'type': 'verb'},
      {'word': 'cunning', 'type': 'adjective'},
      {'word': 'cut', 'type': 'verb'},
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
          VocabularyContainer(header: "A", vocabulary: vocabularyA),
          VocabularyContainer(header: "B", vocabulary: vocabularyB),
          VocabularyContainer(header: "C", vocabulary: vocabularyC),
        ],
      ),
    );
  }
}
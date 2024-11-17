// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_list_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';

class WordList extends StatefulWidget {
  const WordList({super.key});

  // Function onSearch;

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  List<Vocab> mapWords(wordList, index) {
    List<Vocab> listVocab = [];
    List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];


    for (var i = 0; i < wordList.length; i++) {
      if (wordList[i].alphabet == letters[index]) {
        listVocab.add(wordList[i]);
      }
    }

    for (var word in listVocab) {
      print("${word.alphabet} : ${word.word}");
    }

    return listVocab;
  }

  var controllerWord = Get.find<WordListController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Glossary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(
          () {
            var listWords = controllerWord.words.value?.body ?? [];
            if (controllerWord.isLoading.isTrue || controllerWord.words.value == null) {
              return const Text("Loading ...");
            } else if (controllerWord.errorMessage.isNotEmpty) {
              return Text(controllerWord.errorMessage.value);
            } else if (listWords.isEmpty) {
              return const Text("No words found");
            } else {
              print("List Words: $listWords");
              return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 26,
                    itemBuilder: (context, index) {
                      print("Index: $index");
                      List<Vocab> listVocab = [];
                      listVocab = mapWords(listWords, index);

                          return VocabularyContainer(
                            header: listVocab.first.alphabet!,
                            vocabulary: listVocab,
                          );
                        }),
                  );
                }
        },),
      ],
    );
  }
}

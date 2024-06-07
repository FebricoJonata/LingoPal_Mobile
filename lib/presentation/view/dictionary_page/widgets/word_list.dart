import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_list_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/vocabulary_container.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  List<Vocab> mapWords (wordList, index) {
    List<Vocab> listVocab = [];
    List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

    // int idx = 0;

    for (var i = 0; i < wordList.length; i++) {

      if(wordList[i].alphabet == letters[index]){
        listVocab.add(wordList[i]);
      }
    }

    for (var word in listVocab) {
      print("${word.alphabet} : ${word.word}");
    }

    return listVocab;
  }

  @override
  Widget build(BuildContext context) {

    // Dummy Data
    // List<Map<String, String>> vocabularyA = [
    //   {'word': 'a / an', 'type': 'determiner'},
    //   {'word': 'ability', 'type': 'noun'},
    //   {'word': 'able', 'type': 'adjective'},
    //   {'word': 'about', 'type': 'adverb / preposition'},
    // ];

    // List<Map<String, String>> vocabularyB = [
    //   {'word': 'back', 'type': 'noun'},
    //   {'word': 'bad', 'type': 'adjective'},
    //   {'word': 'bounce', 'type': 'verb'},
    //   {'word': 'bump', 'type': 'noun'},
    // ];

    // List<Map<String, String>> vocabularyC = [
    //   {'word': 'can', 'type': 'noun'},
    //   {'word': 'come', 'type': 'verb'},
    //   {'word': 'cunning', 'type': 'adjective'},
    //   {'word': 'cut', 'type': 'verb'},
    // ];
    var controllerWord = Get.find<WordListController>();

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
          GetBuilder<WordListController>(builder: (controllerWord) {
            return FutureBuilder(
              future: controllerWord.getVocabs(), 
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Text("Memuat kata-kata ...");
                }
                else if(snapshot.hasError){
                  return Text("Error memuat data");
                }
                else if(!snapshot.hasData){
                  return Text("Tidak ditemukan data");
                }
                else {
                  var listWords = controllerWord.words.value!.body;
                  print("List Words: $listWords");
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 26,
                    itemBuilder: (context, index) {
                      List<Vocab> listVocab= [];
                      listVocab = mapWords(listWords, index);
                      // return Text("${listVocab[index].alphabet}");
                      // if(index==0){listVocab.add(listWords![0]);}
                      // else if(listWords![index].alphabet!=listWords[index-1].alphabet){
                      //   listVocab.clear();
                      //   listVocab.add(listWords[index]);
                      // }
                      // print("Current letter: ${listVocab.first.alphabet}");
                      // for (var vocab in listVocab) {
                      //   print("${vocab.alphabet} : ${vocab.word}");
                      // }
                      return VocabularyContainer(header: listVocab.first.alphabet!, vocabulary: listVocab);
                    }
                  );
                }
              },
            );
          },)
          // VocabularyContainer(header: "A", vocabulary: vocabularyA),
          // VocabularyContainer(header: "B", vocabulary: vocabularyB),
          // VocabularyContainer(header: "C", vocabulary: vocabularyC),
        ],
      ),
    );
  }
}
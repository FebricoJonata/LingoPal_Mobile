// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_card_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/data_model.dart';

class WordCard extends StatefulWidget {
  WordCard({super.key, required this.searchWord});

  String searchWord;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  var controllerTTS = Get.find<AudioController>();
  var controllerWordCard = Get.find<WordCardController>();

  String searchLowerCase(String word) {
    return word.toLowerCase();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String search = searchLowerCase(widget.searchWord);
      controllerWordCard.getWordDetails(search);
    });

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx((){
        var wordList = controllerWordCard.details.value ?? [];
        if(controllerWordCard.isLoading.isTrue || controllerWordCard.details.value == null ){
          return const Text("Loading ...");
        }
        else if(controllerWordCard.errorMessage.isNotEmpty){
          return Text(controllerWordCard.errorMessage.value);
        }
        else if(wordList.isEmpty){
          return Column(
              children: [
                const Text("Word not found"),
                SizedBox(
                  height: 50.h,
                ),
                const Text("This could be due to a mistake in your search or the word you're looking for may not exist")
              ],
          );
        }
        else {
          print("$wordList");
          WordData fixedData = wordList.first!;
          String word = fixedData.word!;
          String wordforCard = word[0].toUpperCase() + word.substring(1);
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: MyColors.primaryGreen,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // kata
                      Row(
                        children: [
                          Text(
                            wordforCard,
                            style: TextStyle(color: MyColors.secondaryYellow, fontSize: 60.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          IconButton(
                              onPressed: () {
                                controllerTTS.fetchAudioFromApi(wordforCard);
                              },
                              icon: const Icon(
                                Icons.volume_up_rounded,
                                color: MyColors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      // arti
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: fixedData.meanings!.length,
                        itemBuilder: (context, index) {
                          String pos= fixedData.meanings![index].partOfSpeech.toString();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("($pos)", style: const TextStyle(color: MyColors.primaryYellow, fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                fixedData.meanings![index].definitions!.first.definition!,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: MyColors.white),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 50.h,
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                // contoh kalimat
                const Text(
                  "Example",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: fixedData.meanings!.first.definitions!.length,
                  itemBuilder: (context, index) {
                    String? example = fixedData.meanings!.first.definitions![index].example;
                    if ( example != null) {
                      String sentence = example;
                      return Text(
                        sentence,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      );
                    } else {
                      return null;
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                // sinonim
                SizedBox(
                  height: 50.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Synonyms",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: fixedData.meanings!.first.synonyms!.length,
                            itemBuilder: (context, index) {
                              if (fixedData.meanings!.first.synonyms!.isEmpty) {
                                return const Text("-");
                              }
                              return Text(
                                fixedData.meanings!.first.synonyms![index],
                                style: const TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold),
                              );
                            },
                            separatorBuilder: ((context, index) {
                              return SizedBox(
                                width: 50.w,
                              );
                            })),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                // antonim
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Antonyms",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: fixedData.meanings!.first.antonyms!.length,
                          itemBuilder: (context, index) {
                            if (fixedData.meanings!.first.antonyms!.isEmpty) {
                              return const Text("-");
                            }
                            return Text(
                              fixedData.meanings!.first.antonyms![index],
                              style: const TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold),
                            );
                          },
                          separatorBuilder: ((context, index) {
                            return SizedBox(
                              width: 50.w,
                            );
                          })),
                    )
                  ],
                ),
              ],
            );
        }
      })
    );
  }
}

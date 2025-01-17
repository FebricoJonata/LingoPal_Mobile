// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
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
  Widget build(BuildContext context) {
    printError(info: "In word card 2");
    String search = searchLowerCase(widget.searchWord);
    controllerWordCard.getWordDetails(search);
    return SingleChildScrollView(child: Obx(() {
      var wordList = controllerWordCard.details;
      if (controllerWordCard.isLoading.isTrue) {
        return Text("loading".tr);
      } else if (controllerWordCard.errorMessage.isNotEmpty) {
        return Text(controllerWordCard.errorMessage.value);
      } else if (wordList.isEmpty) {
        return Column(
          children: [
            Text("word_not_found".tr),
            SizedBox(
              height: 50.h,
            ),
            Text("source_not_found".tr, textAlign: TextAlign.center)
          ],
        );
      } else {
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
                      controllerTTS.isLoading.isFalse
                          ? IconButton(
                              onPressed: () async {
                                controllerTTS.fetchAudioFromApi(wordforCard);
                              },
                              icon: const Icon(
                                Icons.volume_up_rounded,
                                color: MyColors.white,
                              ))
                          : const CircularProgressIndicator(
                              color: MyColors.secondaryGreen,
                            )
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
                      String pos = fixedData.meanings![index].partOfSpeech.toString();

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
                if (example != null) {
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
              height: 60.h,
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
            SizedBox(
              height: 60.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Antonyms",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Expanded(
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
            ),
          ],
        );
      }
    }));
  }
}

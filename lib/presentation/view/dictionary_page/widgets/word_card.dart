// ignore_for_file: must_be_immutable

import 'package:dictionaryx/dictentry.dart';
import 'package:dictionaryx/dictionary_msa.dart';
import 'package:dictionaryx/dictionary_reduced_msa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';

class WordCard extends StatefulWidget {
  WordCard({super.key, required this.searchWord});

  String searchWord;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  var controllerTTS = Get.find<AudioController>();
  var dReducedMSA = DictionaryMSA();

  String searchLowerCase(String word) {
    return word.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    String search = widget.searchWord;
    DictEntry entry;

    return SingleChildScrollView(
      child: Builder(
        builder: (context) {
          search = searchLowerCase(search);
          if (!dReducedMSA.hasEntry(search)) {
            return Column(
              children: [
                const Text("Word not found"),
                SizedBox(
                  height: 50.h,
                ),
                const Text("This could be due to a mistake in your search or  you're looking for may not exist")
              ],
            );
          } else {
            // setup kata
            entry = dReducedMSA.getEntry(search);

            String word = entry.word;
            String wordforCard = word[0].toUpperCase() + word.substring(1);
            // ui
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
                            style: TextStyle(
                                color: MyColors.secondaryYellow, fontSize: 60.sp, fontWeight: FontWeight.bold),
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
                        itemCount: entry.meanings.length,
                        itemBuilder: (context, index) {
                          String posEntry = entry.meanings[index].pos.toString();
                          String pos = posEntry.substring(4);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("($pos)",
                                  style: const TextStyle(color: MyColors.primaryYellow, fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                entry.meanings[index].description,
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
                  itemCount: entry.meanings.length,
                  itemBuilder: (context, index) {
                    bool checkExamples = entry.meanings[index].hasExamples();
                    if (checkExamples) {
                      String sentence = entry.meanings[index].examples.first;
                      String finalSentence = "${sentence[0].toUpperCase()}${sentence.substring(1)}.";
                      return Text(
                        finalSentence,
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
                            itemCount: entry.synonyms.length,
                            itemBuilder: (context, index) {
                              return Text(
                                entry.synonyms[index],
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
                          itemCount: entry.antonyms.length,
                          itemBuilder: (context, index) {
                            if (entry.antonyms.isEmpty) {
                              return const Text("-");
                            }
                            return Text(
                              entry.antonyms[index],
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
        },
      ),
    );
  }
}

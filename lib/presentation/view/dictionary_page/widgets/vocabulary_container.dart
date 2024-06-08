import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';

class VocabularyContainer extends StatelessWidget {
  final String header;
  // final List<Map<String, String>> vocabulary;
  final List<Vocab> vocabulary;
  Function onsearch;

  VocabularyContainer({
    Key? key,
    required this.header,
    required this.vocabulary,
    required this.onsearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColors.primaryGreen,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                height: 1.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [MyColors.primaryGreen, MyColors.secondaryGreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: vocabulary.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => {onsearch(item.word!)},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        item.word!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Text(
                  //   '(${item['type']})',
                  //   style: const TextStyle(fontSize: 16, color: Colors.black54),
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}

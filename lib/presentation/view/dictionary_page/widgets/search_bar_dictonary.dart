import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class SearchBarDictonary extends StatelessWidget {
  const SearchBarDictonary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetConstraints.englishFlag,
              width: 24,
              height: 24,
            ),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for words...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform search action
            },
          ),
        ],
      ),
    );
  }
}

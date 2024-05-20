import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

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
      child: const Row(
        children: [
          Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for words...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

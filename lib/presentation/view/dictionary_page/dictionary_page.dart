import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            const Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Glossary",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Icon(Icons.list)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

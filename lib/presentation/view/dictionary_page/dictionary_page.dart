import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/presentation/view/components/primary_btn_reusable.dart';

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
        child: PrimaryBtn(btnText: "Dictionary", width: 500.w, height: 200.h),
      ),
    );
  }
}

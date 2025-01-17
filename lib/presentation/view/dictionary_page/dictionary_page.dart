import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_list_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/searchbar_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/components/search_bar_reusable.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/word_card.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/widgets/word_list.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final _controllerWord = Get.find<WordListController>();
  final _controllerSearch = Get.find<SearchBarController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controllerSearch.setSearchWord("");
    });
  }

  @override
  Widget build(BuildContext context) {
    // _controllerSearch.searches.value = "";
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: 1179.w,
          height: 2556.h,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 200.h),
          color: MyColors.secondaryYellow,
          child: Column(
            children: [
              Image.asset(AssetConstraints.bgIntroTop),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 30, left: 30, bottom: 100.h),
                  child: Column(
                    children: [
                      ReuseSearchBar(
                        onPressed: (value) {
                          // searches = _controllerSearch.searches.value;
                          // controllerVocab.setWordCard(_controllerSearch.searches.value);
                        },
                      ),
                      const SizedBox(height: 24),
                      Obx(() {
                        if (_controllerSearch.searches.value.isEmpty) {
                          return const Expanded(child: WordList());
                        } else {
                          printError(info: _controllerSearch.searches.value);
                          return Expanded(
                              child: WordCard(
                            searchWord: _controllerSearch.searches.value,
                          ));
                        }
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

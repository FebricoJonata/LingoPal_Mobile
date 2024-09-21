import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_list_controller.dart';

class DictionaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordListController());
  }
}

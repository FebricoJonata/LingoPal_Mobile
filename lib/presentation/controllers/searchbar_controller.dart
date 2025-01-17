import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final RxString _searches = "".obs;

  get searches => _searches;

  setSearchWord(keyword) {
    searches.value = keyword;
  }
}

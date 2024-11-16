import 'package:get/get.dart';

class SearchBarController extends GetxController{
  RxString searches = "".obs;

  setSearchWord(keyword){
    searches.value = keyword;
  }

  // Widget searchBarTrail(){
  //   if(searches)
  // }
}
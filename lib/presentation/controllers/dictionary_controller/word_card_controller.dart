import 'package:dartz/dartz.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/data_model.dart';

class WordCardController extends GetxController{
  Rx<WordData?> details = Rx<WordData?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<Either<Failure, WordData>> getWordDetails() async {
    // k
  }
}
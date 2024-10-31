import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';

class WordListController extends GetxController {
  Rx<WordModel?> words = Rx<WordModel?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<Either<Failure, WordModel>> getVocabs() async {
    try {
      isLoading.value = true;
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/word", options: Options(headers: {'accept': 'application/json'}));

      var wordModel = WordModel.fromJson(response.data);
      words(wordModel);

      return Right(wordModel);
    } catch (e) {
      print("Error: $e");
      errorMessage.value = e.toString();
      return Left(Failure("$e"));
    }
    finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getVocabs();
  }

  @override
  void onClose() {
    super.onClose();
    getVocabs();
  }
}

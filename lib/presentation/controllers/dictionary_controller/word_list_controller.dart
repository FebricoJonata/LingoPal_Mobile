import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';

class WordListController extends GetxController{

  Rx<WordModel?> words = Rx<WordModel?>(null);

  Future <Either<Failure, WordModel>> getVocabs() async {
    try {
      
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/word", 
        options: Options(headers: {'accept': 'application/json'}));

      print("Vocab list: ${response.data}");
      var wordModel = WordModel.fromJson(response.data);
      words(wordModel);

      return Right(wordModel);

    } catch (e) {
      print("Error: $e");
      return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
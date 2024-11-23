import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';

import '../../../core/error/errors.dart';

class WordListController extends GetxController {
  Rx<WordModel?> words = Rx<WordModel?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<Either<Failure, WordModel>?> getVocabs() async {
    try {
      isLoading.value = true;
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/word", options: Options(headers: {'accept': 'application/json'}));
      if (response.statusCode == 200) {
        var wordModel = WordModel.fromJson(response.data);
        words.value = wordModel;

        return Right(wordModel);
      } else {
        isLoading.value = false;

        return Left(Failure(response.statusCode.toString()));
      }
    } on DioException catch (e) {
      isLoading.value = false;
      String errorMessage;
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "Failed to connect to the server. Please check your internet connection.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }
      showError(e.response?.statusCode, errorMessage);
    } catch (e) {
      showError(0, e.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  @override
  void onInit() async {
    super.onInit();
    await getVocabs();
  }
}

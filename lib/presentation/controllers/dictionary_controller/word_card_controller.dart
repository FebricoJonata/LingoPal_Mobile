import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/core/error/errors.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/data_model.dart';

class WordCardController extends GetxController {
  RxList<WordData?> details = <WordData?>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<Either<Failure, List<WordData?>>?> getWordDetails(String word) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      // var uri = Uri.https('https://api.dictionaryapi.dev/api/v2/entries/en/', word);
      // print(uri);
      final response = await Dio().get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
      var data = response.data as List?;
      var wordData = <WordData?>[];
      if (response.data.toString().startsWith("[")) {
        // wordData = json.decode(response.data.toString());
        // print("After decode: $wordData");
        wordData = data!.map((data) {
          return WordData.fromJson(data);
        }).toList();
      }
      details(wordData);
      return Right(wordData);
    } on DioException catch (e) {
      // isLoading.value = false;
      String errorMessage;

      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "Failed to connect to the server. Please check your internet connection.";
      } else if (e.type == DioExceptionType.badResponse) {
        List<WordData?> wordData = [];
        wordData = [];
        details(wordData);
        return Right(wordData);
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }
      showError(e.response?.statusCode, errorMessage);
    } catch (e) {
      // showError(0, e.toString());
      errorMessage.value = e.toString();
      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}

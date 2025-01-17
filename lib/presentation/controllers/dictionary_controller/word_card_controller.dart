import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/core/error/errors.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_detail_model.dart';

class WordCardController extends GetxController {
  final RxList<WordDetailModel?> _details = <WordDetailModel?>[].obs;
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;

  get isLoading => _isLoading;
  get details => _details;
  get errorMessage => _errorMessage;

  Future<Either<Failure, List<WordDetailModel?>>?> getWordDetails(String word) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      // var uri = Uri.https('https://api.dictionaryapi.dev/api/v2/entries/en/', word);
      // print(uri);
      final response = await Dio().get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
      var data = response.data as List?;
      var wordData = <WordDetailModel?>[];
      if (response.data.toString().startsWith("[")) {
        // wordData = json.decode(response.data.toString());
        // print("After decode: $wordData");
        wordData = data!.map((data) {
          return WordDetailModel.fromJson(data);
        }).toList();
      }
      _details(wordData);
      return Right(wordData);
    } on DioException catch (e) {
      // _isLoading.value = false;

      if (e.type == DioExceptionType.connectionTimeout) {
        _errorMessage.value = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        _errorMessage.value = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        _errorMessage.value = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        _errorMessage.value = "Failed to connect to the server. Please check your internet connection.";
      } else if (e.type == DioExceptionType.badResponse) {
        List<WordDetailModel?> wordData = [];
        wordData = [];
        _details(wordData);
        return Right(wordData);
      } else {
        _errorMessage.value = e.message ?? "An unexpected error occurred.";
      }
      showError(e.response?.statusCode, _errorMessage.value);
    } catch (e) {
      // showError(0, e.toString());
      _errorMessage.value = e.toString();
      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
    return null;
  }
}

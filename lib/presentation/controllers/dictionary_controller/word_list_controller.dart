import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/dictionary_model/word_model.dart';

import '../../../core/error/errors.dart';

class WordListController extends GetxController {
  final Rx<WordModel?> _words = Rx<WordModel?>(null);
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _storage = const FlutterSecureStorage();

  get words => _words;
  get isLoading => _isLoading;
  get errorMessage => _errorMessage;

  Future<Either<Failure, WordModel>?> getVocabs() async {
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/word", options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        var wordModel = WordModel.fromJson(response.data);
        _words.value = wordModel;

        return Right(wordModel);
      } else {
        _isLoading.value = false;

        return Left(Failure(response.statusCode.toString()));
      }
    } on DioException catch (e) {
      _isLoading.value = false;
      if (e.type == DioExceptionType.connectionTimeout) {
        _errorMessage.value = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        _errorMessage.value = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        _errorMessage.value = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        _errorMessage.value = "Failed to connect to the server. Please check your internet connection.";
      } else {
        _errorMessage.value = e.message ?? "An unexpected error occurred.";
      }
      showError(e.response?.statusCode, _errorMessage.value);
    } catch (e) {
      showError(0, e.toString());
    } finally {
      _isLoading.value = false;
    }
    return null;
  }

  @override
  void onInit() async {
    super.onInit();
    await getVocabs();
  }
}

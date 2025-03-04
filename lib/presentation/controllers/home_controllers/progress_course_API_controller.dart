// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';

import 'package:lingo_pal_mobile/presentation/model/home_model/progress_model.dart';

class ProgressAPIController extends GetxController {
  final _isLoading = false.obs;

  final _storage = const FlutterSecureStorage();
  final Rx<ProgressUserModel?> _progress = Rx<ProgressUserModel?>(null);

  get isLoading => _isLoading;
  get progress => _progress;
  
  Future<Either<Failure, ProgressUserModel>> getProgress() async {
    var userId = await _storage.read(key: "userId");
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/users/status',
        queryParameters: {'user_id': userId},
        options: Options(
          headers: {"Accept": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );

      var progressModel = ProgressUserModel.fromJson(response.data);

      _progress(progressModel);

      return Right(progressModel);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");

      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProgress();
  }

  @override
  void onClose() {
    super.onClose();
    getProgress();
  }
}

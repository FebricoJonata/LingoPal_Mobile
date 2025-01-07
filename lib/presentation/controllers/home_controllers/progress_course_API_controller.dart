// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';

import 'package:lingo_pal_mobile/presentation/model/home_model/progress_model.dart';

class ProgressAPIController extends GetxController {
  var isLoading = false.obs;

  var storage = const FlutterSecureStorage();
  Rx<ProgressUserModel?> progress = Rx<ProgressUserModel?>(null);
  Future<Either<Failure, ProgressUserModel>> getProgress() async {
    var userId = await storage.read(key: "userId");
    String? accessToken = await storage.read(key: "token");
    try {
      isLoading.value = true;
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/users/status',
        queryParameters: {'user_id': userId},
        options: Options(
          headers: {"Accept": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );

      var progressModel = ProgressUserModel.fromJson(response.data);

      progress(progressModel);

      return Right(progressModel);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");

      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
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

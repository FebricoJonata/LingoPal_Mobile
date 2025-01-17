// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';

class PracticeCourseController extends GetxController {
  final Rx<PracticeModel?> _practices = Rx<PracticeModel?>(null);
  final _controllerProfile = Get.find<GetProfileController>();
  final Rx<PracticeProgressModel?> _practiceProgress = Rx<PracticeProgressModel?>(null);
  final RxInt _indexPractice = 0.obs;
  RxInt _practiceId = 0.obs;
  RxInt _courseId = 0.obs;
  var _isLoading = false.obs;

  var storage = const FlutterSecureStorage();

  get courseId => _courseId;
  get practices => _practices;
  get practiceProgress => _practiceProgress;
  get isLoading => _isLoading;
  get practiceId => _practiceId;
  get indexPractice => _indexPractice;

  Future<Either<Failure, PracticeModel>> getPractices(courseId) async {
    String? accessToken = await storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice',
          queryParameters: {'course_id': courseId}, options: Options(headers: {"Accept": "application/json", "Authorization": "Bearer $accessToken"}));

      var practiceModel = PracticeModel.fromJson(response.data);
      _practices(practiceModel);
      return Right(practiceModel);
    } catch (e) {
      print("Error");
      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
  }

  Future<Either<Failure, PracticeProgressModel>> getUserPractices() async {
    var userId = await storage.read(key: "userId");
    String? accessToken = await storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice/progress',
          queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));

      var userPractices = PracticeProgressModel.fromJson(response.data);

      _practiceProgress(userPractices);

      return Right(userPractices);
    } catch (e) {
      print("Error: $e");
      _isLoading.value = false;
      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
  }
}

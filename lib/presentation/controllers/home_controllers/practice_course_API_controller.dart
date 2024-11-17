// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';

class PracticeCourseController extends GetxController {
  Rx<PracticeModel?> practices = Rx<PracticeModel?>(null);
  var controllerProfile = Get.find<GetProfileController>();
  Rx<PracticeProgressModel?> practiceProgress = Rx<PracticeProgressModel?>(null);
  RxInt indexPractice = 0.obs;
  RxInt practiceId = 0.obs;
  RxInt courseId = 0.obs;
  var isLoading = false.obs;

  var storage = const FlutterSecureStorage();
  Future<Either<Failure, PracticeModel>> getPractices(courseId) async {
    try {
      isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice', queryParameters: {'course_id': courseId}, options: Options(headers: {"Accept": "application/json"}));

      var practiceModel = PracticeModel.fromJson(response.data);
      practices(practiceModel);
      print("Practice: ${response.data}");
      return Right(practiceModel);
    } catch (e) {
      print("Error");
      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
    }
  }

  Future<Either<Failure, PracticeProgressModel>> getUserPractices() async {
    var userId = await storage.read(key: "userId");
    try {
      final response =
          await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice/progress', queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json'}));

      var userPractices = PracticeProgressModel.fromJson(response.data);

      practiceProgress(userPractices);
      print("User practice: ${response.data}");
      return Right(userPractices);
    } catch (e) {
      print("Error: $e");
      return Left(Failure("$e"));
    }
  }
}

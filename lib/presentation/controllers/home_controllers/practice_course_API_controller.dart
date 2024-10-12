// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_progress_model.dart';

class PracticeCourseController extends GetxController {
  Rx<PracticeModel?> practices = Rx<PracticeModel?>(null);
  var controllerProfile = Get.find<GetProfileController>();
  Rx<PracticeProgressModel?> practiceProgress = Rx<PracticeProgressModel?>(null);

  Future<Either<Failure, PracticeModel>> getPractices(courseId) async {
    try {
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice',
          queryParameters: {'course_id': courseId}, options: Options(headers: {"Accept": "application/json"}));

      var practiceModel = PracticeModel.fromJson(response.data);
      practices(practiceModel);

      return Right(practiceModel);
    } catch (e) {
      print("Error");
      return Left(Failure("$e"));
    }
  }

  Future<Either<Failure, PracticeProgressModel>> getUserPractices() async {
    var userId = controllerProfile.profile.value?.body?.data?.first.userId;
    try {
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/practice/progress',
          queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json'}));

      var userPractices = PracticeProgressModel.fromJson(response.data);

      practiceProgress(userPractices);
      return Right(userPractices);
    } catch (e) {
      print("Error: $e");
      return Left(Failure("$e"));
    }
  }
}

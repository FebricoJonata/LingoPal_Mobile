import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';

class CourseController extends GetxController {
  Rx<CourseModel?> courses = Rx<CourseModel?>(null);
  Rx<CourseProgressModel?> courseProgress = Rx<CourseProgressModel?>(null);
  var controllerProfile = Get.find<GetProfileController>();
  // get master course
  Future<Either<Failure, CourseModel>> getCourses() async {
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/course',
        options: Options(
          headers: {'accept': 'application/json'}
        )
      );

      var courseModel = CourseModel.fromJson(response.data);
      courses(courseModel);
      // print("success ${response.data}");
      
      return Right(courseModel);
    } catch (e) {
      print("error");
      return Left(Failure("$e"));
    }
  }

  // get user course progress
  Future<Either<Failure, CourseProgressModel>> getUserCourseProgress() async {
    var userId = controllerProfile.profile.value?.body?.data?.first.userId;
    print('USER ID in Course Controller: {$userId}');
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/course/progress',
        queryParameters: {'user_id' : controllerProfile.profile.value?.body?.data?.first.userId},
        options: Options(
          headers: {'accept' : 'application/json'}
        )
      );

      var userCourseProgress = CourseProgressModel.fromJson(response.data);
      courseProgress(userCourseProgress);
      print("response: ${response.data}");
      return Right(userCourseProgress);

    } catch (e) {
      print("error: ${e}");
      return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCourses();
  }

  @override
  void onClose() {
    super.onClose();
    getCourses();
  }
}
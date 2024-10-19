// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';

class CourseController extends GetxController {
  Rx<CourseModel?> courses = Rx<CourseModel?>(null);
  var controllerLogin = Get.find<LoginAPIController>();
  Rx<CourseProgressModel?> courseProgress = Rx<CourseProgressModel?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  // get master course
  Future<Either<Failure, CourseModel>> getCourses() async {
    try {
      isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course', options: Options(headers: {'accept': 'application/json'}));

      var courseModel = CourseModel.fromJson(response.data);
      courses(courseModel);

      return Right(courseModel);
    } on DioException catch (e) {
      print("$e");
      return Left(Failure("$e"));
    } catch (e) {
      print("error");
      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
    }
  }

  // get user course progress
  Future<Either<Failure, CourseProgressModel>> getUserCourseProgress() async {
    var userId = controllerLogin.login.value?.user?.userId;

    try {
      isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course/progress', queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json'}));

      var userCourseProgress = CourseProgressModel.fromJson(response.data);

      courseProgress(userCourseProgress);
      return Right(userCourseProgress);
    } catch (e) {
      isLoading.value = false;

      return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCourses();
    getUserCourseProgress();
  }
}

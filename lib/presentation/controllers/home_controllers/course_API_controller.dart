// ignore_for_file: file_names


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';

import '../../../core/error/errors.dart';

class CourseController extends GetxController {
  Rx<CourseModel?> courses = Rx<CourseModel?>(null);
  var controllerLogin = Get.find<LoginAPIController>();
  Rx<CourseProgressModel?> courseProgress = Rx<CourseProgressModel?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var totalCoursesBefore = 0.obs;
  var storage = const FlutterSecureStorage();
  // get master course
  Future<Either<Failure, CourseModel>?> getCourses() async {
    String? accessToken = await storage.read(key: "token");
    try {
      isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course', options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));

      var courseModel = CourseModel.fromJson(response.data);
      courses(courseModel);

      return Right(courseModel);
    } on DioException catch (e) {
      isLoading.value = false;
      String errorMessage;
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "Failed to connect to the server. Please check your internet connection.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }

      // Tampilkan modal error
      showError(e.response?.statusCode, errorMessage);
    } catch (e) {
      isLoading.value = false;
      showError(0, e.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  // get user course progress
  Future<Either<Failure, CourseProgressModel>> getUserCourseProgress() async {
    var userId = await storage.read(key: "userId");
    String? accessToken = await storage.read(key: "token");
    try {
      isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course/progress',
          queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));

      var userCourseProgress = CourseProgressModel.fromJson(response.data);

      courseProgress(userCourseProgress);
      var activeCourses = courseProgress.value?.body ?? [];
      if(totalCoursesBefore.value == 0){
        totalCoursesBefore.value = activeCourses.length;
      }
      else {
        print("alert kebuka masuk sini active: ${activeCourses.length}");
        if(totalCoursesBefore.value<activeCourses.length){
          print("ada update course");
          var lastCourseId = activeCourses.last.courseId;
          var courseList = courses.value?.body ?? [];
          var newCourse = courseList[lastCourseId!-1];
          print("sebelum update");
          Get.dialog(Alert(title: "New Course Unlocked!", message: "Hooray! You've finally unlocked course ${newCourse.courseName} - ${newCourse.category!.courseCategoryName}", imagePath: "assets/images/robots/happy.png",
          onClose: () async {
            Get.back();
          }, ));
          totalCoursesBefore.value = activeCourses.length;
        }
      }
      return Right(userCourseProgress);
    } catch (e) {
      isLoading.value = false;

      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCourses();
    getUserCourseProgress();
  }
}

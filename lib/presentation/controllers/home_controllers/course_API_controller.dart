// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';

import '../../../core/error/errors.dart';

class CourseController extends GetxController {
  final Rx<CourseModel?> _courses = Rx<CourseModel?>(null);
  final Rx<CourseProgressModel?> _courseProgress = Rx<CourseProgressModel?>(null);
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _totalCoursesBefore = 0.obs;
  final _storage = const FlutterSecureStorage();

  get courses => _courses;
  get courseProgress => _courseProgress;
  get isLoading => _isLoading;
  get errorMessage => _errorMessage;

  // get master course
  Future<Either<Failure, CourseModel>?> getCourses() async {
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course', options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));

      var courseModel = CourseModel.fromJson(response.data);
      _courses(courseModel);

      return Right(courseModel);
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

      // Tampilkan modal error
      showError(e.response?.statusCode, _errorMessage.value);
    } catch (e) {
      _isLoading.value = false;
      showError(0, e.toString());
    } finally {
      _isLoading.value = false;
    }
    return null;
  }

  // get user course progress
  Future<Either<Failure, CourseProgressModel>> getUserCourseProgress() async {
    var userId = await _storage.read(key: "userId");
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course/progress',
          queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));

      var userCourseProgress = CourseProgressModel.fromJson(response.data);

      _courseProgress(userCourseProgress);
      var activeCourses = _courseProgress.value?.body ?? [];
      if (_totalCoursesBefore.value == 0) {
        _totalCoursesBefore.value = activeCourses.length;
      } else {
        if (_totalCoursesBefore.value < activeCourses.length) {
          var lastCourseId = activeCourses.last.courseId;
          var courseList = _courses.value?.body ?? [];
          var newCourse = courseList[lastCourseId! - 1];

          Get.dialog(Alert(
            title: "New Course Unlocked!",
            message: "Hooray! You've finally unlocked course ${newCourse.courseName} - ${newCourse.category!.courseCategoryName}",
            imagePath: "assets/images/robots/happy.png",
            onClose: () async {
              Get.back();
            },
          ));
          _totalCoursesBefore.value = activeCourses.length;
        }
      }
      return Right(userCourseProgress);
    } catch (e) {
      _isLoading.value = false;

      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCourses();
    getUserCourseProgress();
  }
}

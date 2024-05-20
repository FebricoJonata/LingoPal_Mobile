import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_progress_model.dart';

class CourseController extends GetxController {
  Rx<CourseModel?> courses = Rx<CourseModel?>(null);
  var controllerProfile = Get.find<GetProfileController>();
  Rx<CourseProgressModel?> courseProgress = Rx<CourseProgressModel?>(null);
  // get master course
  Future<Either<Failure, CourseModel>> getCourses() async {
    try {
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course',
          options: Options(headers: {'accept': 'application/json'}));

      var courseModel = CourseModel.fromJson(response.data);
      courses(courseModel);
      print("success retrieve courses: ${response.data}");

      return Right(courseModel);
    } on DioException catch (e) {
      print("Sattt");
      print("$e");
      return Left(Failure("$e"));
    } catch (e) {
      print("error");
      return Left(Failure("$e"));
    }
  }

  // get user course progress
  Future<Either<Failure, CourseProgressModel>> getUserCourseProgress() async {
    // await controllerProfile.profileAPI().whenComplete(() => null);
    // controllerProfile.getprofil
    var userId = controllerProfile.profile.value?.body?.data?.first.userId;
    print('USER ID in Course Controller: ${userId}');
    try {
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/course/progress',
          queryParameters: {'user_id': userId}, options: Options(headers: {'accept': 'application/json'}));

      var userCourseProgress = CourseProgressModel.fromJson(response.data);
      print("User Progress Response: ${response.data}");
      courseProgress(userCourseProgress);
      return Right(userCourseProgress);
    } catch (e) {
      print("error: ${e}");
      return Left(Failure("$e"));
    }
  }


  // Future fetchProgressAfterProfile() async {
  //   controllerProfile.profileAPI().whenComplete(() => getUserCourseProgress());
  // }

  @override
  void onInit() {
    super.onInit();
    // fetchProgressAfterProfile();
    controllerProfile.profileAPI();
    getCourses();
    getUserCourseProgress();
  }

  @override
  void onClose() {
    super.onClose();
    // controllerProfile.profileAPI();
    getCourses();
    // getUserCourseProgress();
  }
}

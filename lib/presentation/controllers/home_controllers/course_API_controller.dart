import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/course_model.dart';

class CourseController extends GetxController {
  Rx<CourseModel?> courses = Rx<CourseModel?>(null);
  // model user course progress
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
      print("success ${response.data}");
      
      return Right(courseModel);
    } catch (e) {
      print("error");
      return Left(Failure("$e"));
    }
  }

  // bikin function tambahan buat get user course progress

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
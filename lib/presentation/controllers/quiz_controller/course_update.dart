import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/course_update_model.dart';

class CourseUpdateController extends GetxController {
  var storage = const FlutterSecureStorage();
  RxBool lstIndex = false.obs;
  Rx<CourseUpdate?> courseUpdate = Rx<CourseUpdate?>(null);

  Future updateCourse(int courseId) async {
    var userId = await storage.read(key: "userId");
    String? accessToken = await storage.read(key: "token");
    try {
      final response = await Dio().post("https://lingo-pal-backend-v1.vercel.app/api/course/update-progress",
          data: {"user_id": userId, "course_id": courseId}, options: Options(headers: {'accept': 'application/json', 'Content-Type': 'application/json', "Authorization": "Bearer $accessToken"}));
      courseUpdate(CourseUpdate.fromJson(response.data));

      return courseUpdate;
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
    } catch (e) {
      print("Error: $e");
      return e;
    }
  }
}

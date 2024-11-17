import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/course_update_model.dart';

class PracticeUpdateController extends GetxController {
  var storage = const FlutterSecureStorage();
  Rx<CourseUpdate?> courseUpdate = Rx<CourseUpdate?>(null);

  Future updatePractice(int progressCourse, int courseId, int point, bool isActive, bool isPassed) async {
    var userId = await storage.read(key: "userId");
    try {
      final response = await Dio().post("https://lingo-pal-backend-v1.vercel.app/api/course/progress",
          data: {"progress_course_id": progressCourse, "user_id": userId, "course_id": courseId, "progress_poin": point, "is_active": isActive, "is_course_completed": isPassed},
          options: Options(headers: {'accept': 'application/json', 'Content-Type': 'application/json'}));
      courseUpdate(CourseUpdate.fromJson(response.data));
      print("Response: ${courseUpdate.value?.body}");
      return courseUpdate;
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
    } catch (e) {
      print("Error: $e");
      return e;
    }
  }
}

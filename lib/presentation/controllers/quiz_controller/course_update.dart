import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/course_update_model.dart';

class CourseUpdateController extends GetxController {
  final _storage = const FlutterSecureStorage();
  final RxBool _lstIndex = false.obs;
  final Rx<CourseUpdate?> _courseUpdate = Rx<CourseUpdate?>(null);
  final RxBool _isLoading = false.obs;

  get lstIndex => _lstIndex;
  get isLoading => _isLoading;

  Future updateCourse(int courseId) async {
    var userId = await _storage.read(key: "userId");
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().post("https://lingo-pal-backend-v1.vercel.app/api/course/update-progress",
          data: {"user_id": userId, "course_id": courseId}, options: Options(headers: {'accept': 'application/json', 'Content-Type': 'application/json', "Authorization": "Bearer $accessToken"}));
      _courseUpdate(CourseUpdate.fromJson(response.data));

      printError(info: "update course");

      return _courseUpdate;
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
    } catch (e) {
      print("Error: $e");
      _isLoading.value = false;
      return e;
    }
    finally {
      _isLoading.value = false;
    }
  }
}

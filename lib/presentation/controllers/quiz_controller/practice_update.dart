import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/practice_update_model.dart';

class PracticeUpdateController extends GetxController {
  final Rx<PracticeUpdate?> _practiceUpdate = Rx<PracticeUpdate?>(null);
  final _storage = const FlutterSecureStorage();
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  Future updatePractice(int progressPractice, int practiceId, int point, bool isActive, bool isPassed, int courseId) async {
    var userId = await _storage.read(key: "userId");
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().post("https://lingo-pal-backend-v1.vercel.app/api/practice/progress",
          data: {"progress_practice_id": progressPractice, "user_id": userId, "course_id": courseId, "practice_id": practiceId, "progress_poin": point, "is_active": isActive, "is_passed": isPassed},
          options: Options(headers: {'accept': 'application/json', 'Content-Type': 'application/json', "Authorization": "Bearer $accessToken"}));
      _practiceUpdate(PracticeUpdate.fromJson(response.data));

      return _practiceUpdate;
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
    } catch (e) {
      _isLoading.value = false;
      print("Error: $e");
      return e;
    } finally {
      _isLoading.value = false;
    }
  }
}

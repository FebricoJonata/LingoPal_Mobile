import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/practice_update_model.dart';

class PracticeUpdateController extends GetxController {
  Rx<PracticeUpdate?> practiceUpdate = Rx<PracticeUpdate?>(null);

  Future updatePractice(int progressPractice, int userId, int practiceId, int point, bool isActive, bool isPassed) async {
    try {
      final response = await Dio().post("https://lingo-pal-backend-v1.vercel.app/api/practice/progress",
          data: {"progress_practice_id": progressPractice, "user_id": userId, "practice_id": practiceId, "progress_poin": point, "is_active": isActive, "is_passed": isPassed},
          options: Options(headers: {'accept': 'application/json', 'Content-Type': 'application/json'}));
      practiceUpdate(PracticeUpdate.fromJson(response.data));
      print("Response: ${practiceUpdate.value?.body}");
      print("Done");
      return practiceUpdate;
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
    } catch (e) {
      print("Error: $e");
      return e;
    }
  }
}

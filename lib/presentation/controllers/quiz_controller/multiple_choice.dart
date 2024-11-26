import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/multiple_choice.dart';

class QuestionsController extends GetxController {
  RxInt indexQuestion = 0.obs;
  Rx<MultipleChoiceData?> mutlipleData = Rx<MultipleChoiceData?>(null);
  var storage = const FlutterSecureStorage();
  Future<Either<Failure, MultipleChoiceData>> fetchQuestions(int practiceID) async {
    String? accessToken = await storage.read(key: "token");
    try {
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/quiz",
          queryParameters: {'practice_id': practiceID}, options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));
      var multipleChoiceData = MultipleChoiceData.fromJson(response.data);
      mutlipleData(multipleChoiceData);

      return Right(multipleChoiceData);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
      print("DioException: ${e.response}");
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      print("Error: $e");
      return Left(Failure('Error: $e'));
    }
  }

  int calculateFinalScore(int totalQuestions, int correctAnswers) {
    return ((correctAnswers / totalQuestions) * 100).toInt();
  }
}

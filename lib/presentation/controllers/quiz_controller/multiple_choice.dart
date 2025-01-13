import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/multiple_choice.dart';

class QuestionsController extends GetxController {
  RxInt indexQuestion = 0.obs;
  RxDouble score = (0.0).obs;
  Rx<QuizModel?> mutlipleData = Rx<QuizModel?>(null);
  var storage = const FlutterSecureStorage();
  Future<Either<Failure, QuizModel>> fetchQuestions(int practiceID) async {
    String? accessToken = await storage.read(key: "token");
    try {
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/quiz",
          queryParameters: {'practice_id': practiceID}, options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}));
      var multipleChoiceData = QuizModel.fromJson(response.data);
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

  int starsValue(int finalScore) {
    if (finalScore >= 90) {
      return 3; // Skor sempurna mendapatkan 3 bintang
    } else if (finalScore >= 60) {
      return 2; // Skor 60-99 mendapatkan 2 bintang
    } else if (finalScore >= 30) {
      return 1; // Skor 30-59 mendapatkan 1 bintang
    } else {
      return 0; // Skor di bawah 30 tidak mendapatkan bintang
    }
  }

  double calculateScore(double scores) {
    return score.value += scores;
  }

  int calculateFinalScorePronoun(double totalScore) {
    return (totalScore / 5).toInt();
  }
}

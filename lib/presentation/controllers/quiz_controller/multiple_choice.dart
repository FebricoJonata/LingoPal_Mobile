import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/multiple_choice.dart';

class MultipleChoiceController extends GetxController {
  Rx<MultipleChoiceData?> mutlipleData = Rx<MultipleChoiceData?>(null);
  Future<Either<Failure, MultipleChoiceData>> fetchMultipleChoice() async {
    try {
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/quiz");
      var multipleChoiceData = MultipleChoiceData.fromJson(response.data);
      mutlipleData(multipleChoiceData);
      print(multipleChoiceData.body?.first.question);
      return Right(multipleChoiceData);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      return Left(Failure('Error: $e'));
    }
  }

  // void checkAnswer(String choice, String answer, int index) {
  //   print('Index : $index');
  //   print("Answer: $answer");
  //   index++;
  //   // return choice.trim().toLowerCase() == answer.trim().toLowerCase();
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMultipleChoice();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    fetchMultipleChoice();
  }
}

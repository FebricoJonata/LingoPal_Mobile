import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/quiz_model/multiple_choice.dart';

class MultipleChoiceController extends GetxController {
  Rx<MultipleChoiceData?> mutlipleData = Rx<MultipleChoiceData?>(null);

  Future<Either<Failure, MultipleChoiceData>> fetchMultipleChoice(int practiceID) async {
    try {
      final response = await Dio().get("https://lingo-pal-backend-v1.vercel.app/api/quiz", queryParameters: {'practice_id': practiceID}, options: Options(headers: {'accept': 'application/json'}));
      var multipleChoiceData = MultipleChoiceData.fromJson(response.data);
      mutlipleData(multipleChoiceData);

      return Right(multipleChoiceData);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");

      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      return Left(Failure('Error: $e'));
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchMultipleChoice();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  //   fetchMultipleChoice();
  // }
}

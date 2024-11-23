import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';
import '../../model/quiz_model/pronoun_model.dart';

class PronounQuizController extends GetxController {
  RxInt flag = 0.obs;
  Rx<SpeechToText?> speechText = Rx<SpeechToText?>(null);
  var isRecord = 0.obs;
  RxDouble score = (0.0).obs;
  Future<Either<Failure, SpeechToText>> sstAPI(String audioPath, String referenceText) async {
    try {
      isRecord.value = 1;
      File audioFile = File(audioPath);
      final audioBytes = await audioFile.readAsBytes();

      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/speech-to-text?referenceText=$referenceText',
        data: audioBytes,
        options: Options(
          headers: {"Content-Type": "audio/wave"},
        ),
      );

      final speechTextModel = SpeechToText.fromJson(response.data);
      speechText(speechTextModel);

      flag.value = 1;
      return Right(speechTextModel);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print("Error 401");
      } else if (e.response?.statusCode == 500) {
        Get.dialog(Alert(
            title: "Please, Retake",
            message: "Your voice is not in English",
            onClose: () {
              Get.back();
            },
            imagePath: AssetConstraints.robotCool));
      }
      print("Error: $e");
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      print("Error Catch: $e");
      return Left(Failure("$e"));
    } finally {
      isRecord.value = 0;
    }
  }

  double calculateScore(double scores) {
    return score.value += score.value;
  }

  int calculateFinalScore(double totalScore) {
    return (totalScore / 5).toInt();
  }
}

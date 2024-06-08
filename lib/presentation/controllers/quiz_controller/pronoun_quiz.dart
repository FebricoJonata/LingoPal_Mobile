import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert_score.dart';

import '../../model/quiz_model/pronoun_model.dart';

class PronounQuizController extends GetxController {
  RxInt flag = 0.obs;
  Rx<SpeechToText?> speechText = Rx<SpeechToText?>(null);
  var isRecord = 0.obs;
  Future<Either<Failure, SpeechToText>> sstAPI(String audioPath) async {
    try {
      isRecord.value = 1;
      File audioFile = File(audioPath);
      final audioBytes = await audioFile.readAsBytes();
      // String? photoName = audioFile.path.split(Platform.pathSeparator).last;
      // print(photoName);

      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/speech-to-text',
        data: audioBytes,
        options: Options(
          headers: {
            "Content-Type": "audio/wave"
            // application/octet-stream
            // "Content-Type": "audio/wave",
          },
        ),
      );

      final speechTextModel = SpeechToText.fromJson(response.data);
      speechText(speechTextModel);
      print('Berhasil sst');
      if (speechTextModel.pronunciationScores!.accuracyScore! < 65) {
        Get.dialog(AlertGood(
            title: "Try Again",
            message: "Haha",
            onClose: () {
              Get.back();
            },
            imagePath: AssetConstraints.robotSad,
            score: "${speechTextModel.pronunciationScores?.accuracyScore}"));
      } else {
        Get.dialog(AlertGood(
            title: "Good Job",
            message: "Haha",
            onClose: () {
              Get.back();
            },
            imagePath: AssetConstraints.robotQuiz,
            score: "${speechTextModel.pronunciationScores?.accuracyScore}"));
      }
      flag.value = 1;
      return Right(speechTextModel);
    } on DioException catch (e) {
      print("errorExp ${e.response?.data}");
      print("errorExp22 ${e.response?.statusCode}");
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
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      print("HAHAHA $e");
      return Left(Failure("$e"));
    } finally {
      isRecord.value = 0;
    }
  }
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';
import '../../model/quiz_model/pronoun_model.dart';

class PronounQuizController extends GetxController {
  RxInt flag = 0.obs;
  Rx<SpeechToText?> speechText = Rx<SpeechToText?>(null);
  var isRecord = 0.obs;

  var storage = const FlutterSecureStorage();
  Future<Either<Failure, SpeechToText>> sstAPI(String audioPath, String referenceText) async {
    String? accessToken = await storage.read(key: "token");
    try {
      isRecord.value = 1;
      File audioFile = File(audioPath);
      final audioBytes = await audioFile.readAsBytes();

      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/speech-to-text?referenceText=$referenceText',
        data: audioBytes,
        options: Options(
          headers: {"Content-Type": "audio/wave", "Authorization": "Bearer $accessToken"},
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
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      Get.dialog(Alert(
          title: "We encountered a problem",
          message: "Don't worry, you could retake",
          onClose: () {
            Get.back();
          },
          imagePath: AssetConstraints.robotCool));
      return Left(Failure("$e"));
    } finally {
      isRecord.value = 0;
    }
  }
}

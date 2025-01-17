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
  final RxInt _flag = 0.obs;
  final Rx<SpeechToTextModel?> _speechText = Rx<SpeechToTextModel?>(null);
  final _isRecord = 0.obs;

  final _storage = const FlutterSecureStorage();

  get speechText => _speechText;
  get flag => _flag;
  get isRecord => _isRecord;

  Future<Either<Failure, SpeechToTextModel>> sstAPI(String audioPath, String referenceText) async {
    String? accessToken = await _storage.read(key: "token");
    try {
      _isRecord.value = 1;
      File audioFile = File(audioPath);
      final audioBytes = await audioFile.readAsBytes();

      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/speech-to-text?referenceText=$referenceText',
        data: audioBytes,
        options: Options(
          headers: {"Content-Type": "audio/wave", "Authorization": "Bearer $accessToken"},
        ),
      );

      final speechTextModel = SpeechToTextModel.fromJson(response.data);
      _speechText(speechTextModel);

      _flag.value = 1;
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
      _isRecord.value = 0;
    }
  }
}

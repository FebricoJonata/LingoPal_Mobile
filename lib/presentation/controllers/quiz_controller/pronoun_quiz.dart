import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:lingo_pal_mobile/core/color/error/failure.dart';

import '../../model/quiz_model/pronoun_model.dart';

class PronounQuizController extends GetxController {
  Rx<SpeechToText?> speechText = Rx<SpeechToText?>(null);
  Future<Either<Failure, SpeechToText>> sstAPI(String audioPath) async {
    try {
      File audioFile = File(audioPath);
      final audioBytes = await audioFile.readAsBytes();
      String? photoName = audioFile.path.split(Platform.pathSeparator).last;
      print(photoName);

      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/speech-to-text',
        data: audioBytes,
        options: Options(
          headers: {
            "Content-Type": "audio/wave",
          },
        ),
      );
      final speechTextModel = SpeechToText.fromJson(response.data);
      speechText(speechTextModel);
      print('Berhasil sst');
      return Right(speechTextModel);
    } on DioException catch (e) {
      print("errorExp ${e.response?.data}");
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      print("$e");
      return Left(Failure("$e"));
    }
  }
}

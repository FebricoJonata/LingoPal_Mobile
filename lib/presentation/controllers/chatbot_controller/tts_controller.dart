import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/tts.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  String audioUrl = '';

  Future<Either<Failure, TTSModel>> fetchAudioFromApi(String text) async {
    try {
      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/text-to-speech',
        data: {"text": text},
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );

      final audio = TTSModel.fromJson(response.data);
      List<int> bytes = base64Decode(audio.audioContent ?? "");

      // Get the application directory
      Directory appDocDir = await getTemporaryDirectory();
      String appDocPath = appDocDir.path;
      File audioFile = File('$appDocPath/audio.wav');
      print("OKAY");
      await audioFile.writeAsBytes(bytes);
      playAudio(audioFile.path);
      return Right(audio);
    } on DioException catch (e) {
      return Left(Failure("$e"));
    } catch (error) {
      return Left(Failure("$error"));
    }
  }

  Future<void> playAudio(String audioFilePath) async {
    AudioPlayer audioPlayer = AudioPlayer();
    // final audioSource = await audioPlayer.setFilePath(audioFilePath);
    // final audioSource = audioPlayer.setSource(AssetSource('ambient_c_motion.mp3'));
    await audioPlayer.play(UrlSource(audioFilePath));
  }
}

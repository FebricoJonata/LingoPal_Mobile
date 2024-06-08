import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart' hide AudioPlayer;
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/tts.model.dart';
// import 'package:base64_audio_source/base64_audio_source.dart';
// import 'package:just_audio/just_audio.dart' hide AudioPlayer;
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  // late AudioPlayer audioPlayer;
  String audioUrl = ''; // URL audio dari response API

  // @override
  // void onInit() {
  //   super.onInit();
  //   audioPlayer = AudioPlayer();
  // }

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
      print("AMAN TTS");
      final audio = await TTSModel.fromJson(response.data);
      print(audio.audioContent);
      // final List<int> audioBytes = base64Decode(audio.audioContent ?? "");

      // Memainkan audio dari bytes menggunakan package audioplayers

      List<int> bytes = base64Decode(audio.audioContent ?? "");

      // Get the application directory
      Directory appDocDir = await getTemporaryDirectory();
      String appDocPath = appDocDir.path;
      File audioFile = File('$appDocPath/audio.wav');
      await audioFile.writeAsBytes(bytes);
      print(audioFile.path);
      playAudio(audioFile.path);
      return Right(audio);
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      return Left(Failure("$e"));
      // return Left(Failure('Error: ${e.message}'));
    } catch (error) {
      print('Error fetching audio: $error');
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

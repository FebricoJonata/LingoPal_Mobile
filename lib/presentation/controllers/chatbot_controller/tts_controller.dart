import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/tts.model.dart';
import 'package:base64_audio_source/base64_audio_source.dart';
import 'package:just_audio/just_audio.dart' hide AudioPlayer;

class AudioController extends GetxController {
  late AudioPlayer audioPlayer;
  String audioUrl = ''; // URL audio dari response API

  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
  }

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
      final List<int> audioBytes = base64Decode(audio.audioContent ?? "");

      // Memainkan audio dari bytes menggunakan package audioplayers
      AudioPlayer audioPlayer = AudioPlayer();
//  await audioPlayer.play(
      // AudioSource.bytes(Uint8List.fromList(audioBytes)));
      // final base64Audio = audio.audioContent;
      // final decodedBytes = base64Decode(base64Audio);

      // final player = AudioPlayer();
      // final audioSource = Base64AudioSource(base64Audio);
      // await player.setAudioSource(audioSource);
      // await player.play();
      // final base64Audio = audio.audioContent;
      // final decodedBytes = base64Decode(base64Audio ?? "");
      // final audioSource = AudioSource.bytes(decodedBytes);
      // await audioPlayer.play(audioSource);
      // playAudio();
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

//   void playAudio() {
//     String base64Audio = audio.audioContent;
// Uint8List decodedBytes = base64Decode(base64Audio);
//     final assetSource = AssetSource(audioUrl); // Replace 'assets/audio.mp3' with your actual asset path
//     _audioPlayer.play(assetSource);
//     // Ganti isLocal menjadi true jika audio diunduh dan disimpan lokal sebelum dimainkan
//   }
}

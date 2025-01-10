import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/tts.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../core/error/errors.dart';

class AudioController extends GetxController {
  String audioUrl = '';
  RxBool isLoading = false.obs;
  var storage = const FlutterSecureStorage();
  Future<Either<Failure, TTSModel>?> fetchAudioFromApi(String text) async {
    String? accessToken = await storage.read(key: "token");
    try {
      isLoading.value = true;
      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/speech/text-to-speech',
        data: {"text": text},
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );

      final audio = TTSModel.fromJson(response.data);
      List<int> bytes = base64Decode(audio.audioContent ?? "");

      // Get the application directory
      Directory appDocDir = await getTemporaryDirectory();
      String appDocPath = appDocDir.path;
      File audioFile = File('$appDocPath/audio.wav');
      await audioFile.writeAsBytes(bytes);
      playAudio(audioFile.path);
      return Right(audio);
    } on DioException catch (e) {
      isLoading.value = false;
      String errorMessage;
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "Failed to connect to the server. Please check your internet connection.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }

      // Tampilkan modal error
      showError(e.response?.statusCode, errorMessage);
    } catch (error) {
      isLoading.value = false;
      showError(0, error.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  Future<void> playAudio(String audioFilePath) async {
    AudioPlayer audioPlayer = AudioPlayer();
    // final audioSource = await audioPlayer.setFilePath(audioFilePath);
    // final audioSource = audioPlayer.setSource(AssetSource('ambient_c_motion.mp3'));
    await audioPlayer.play(UrlSource(audioFilePath));
  }
}

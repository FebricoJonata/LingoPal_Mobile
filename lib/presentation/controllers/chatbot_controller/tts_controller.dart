import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  late AudioPlayer _audioPlayer;
  String _audioUrl = ''; // URL audio dari response API

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
  }

  Future<void> fetchAudioFromApi(String text) async {
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
      _audioUrl = response.data;
      print(_audioUrl);
      playAudio();
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      // return Left(Failure('Error: ${e.message}'));
    } catch (error) {
      print('Error fetching audio: $error');
    }
  }

  void playAudio() {
    final assetSource = AssetSource(_audioUrl); // Replace 'assets/audio.mp3' with your actual asset path
    _audioPlayer.play(assetSource);
    // Ganti isLocal menjadi true jika audio diunduh dan disimpan lokal sebelum dimainkan
  }
}

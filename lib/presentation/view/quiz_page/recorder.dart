import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

class AudioRecorder extends StatefulWidget {
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  late AudioPlayer _audioPlayer;
  late Recording _recording;
  bool _isRecording = false;

  var controllerSpeech = Get.find<PronounQuizController>();
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _recording = Recording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isRecording
                ? Text('Recording...')
                : ElevatedButton(
                    onPressed: _startRecording,
                    child: Text('Start Recording'),
                  ),
            SizedBox(height: 20),
            _isRecording
                ? ElevatedButton(
                    onPressed: _stopRecording,
                    child: Text('Stop Recording'),
                  )
                : Container(),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _playRecording,
            //   child: Text('Play Recording'),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      try {
        await _audioPlayer.stop();
        await _recording.start();
        setState(() {
          _isRecording = true;
        });
      } catch (e) {
        print('Error starting recording: $e');
      }
    } else {
      print('Microphone permission not granted');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recording.stop();
      final path = _recording.path;
      // String? audioName = path.split(Platform.pathSeparator).last;
      // print(audioName);
      print(path);
      // await _audioPlayer.play(UrlSource(path));
      await controllerSpeech.sstAPI(path);

      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }
}

class Recording {
  late String path;
  late bool isRecording;

  Recording() {
    isRecording = false;
  }

  Future<void> start() async {
    if (!isRecording) {
      try {
        Directory appDocDir = await getTemporaryDirectory();
        String appDocPath = appDocDir.path;
        path = '$appDocPath/audio.wav';
        File audioFile = File(path);
        audioFile.create();
      } catch (e) {
        print('Error starting recording: $e');
        isRecording = false;
      }
    }
  }

  Future<void> stop() async {
    if (isRecording) {
      try {
        await Process.run('killall', ['rec']);
        isRecording = false;
      } catch (e) {
        print('Error stopping recording: $e');
        isRecording = false;
      }
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AudioRecorder(),
  ));
}

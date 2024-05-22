import 'dart:async';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:record/record.dart';

import 'platform/audio_recorder_platform.dart';

class Recorder extends StatefulWidget {
  final void Function(String path) onStop;

  const Recorder({super.key, required this.onStop});

  @override
  State<Recorder> createState() => _RecorderState();
}

// final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
// final FlutterFFmpegConfig _flutterFFmpegConfig = FlutterFFmpegConfig();

// Future<String?> convertToWav(String inputPath) async {
//   try {
//     // Dapatkan direktori sementara
//     final Directory tempDir = await getTemporaryDirectory();
//     final String outputPath = "${tempDir.path}/output.wav";

//     // Jalankan perintah FFmpeg
//     await FFmpegKit.execute('-i $inputPath $outputPath').then((session) async {
//       final returnCode = await session.getReturnCode();

//       if (ReturnCode.isSuccess(returnCode)) {
//         print("Conversion successful: $outputPath");
//         return outputPath;
//       } else if (ReturnCode.isCancel(returnCode)) {
//         print("Conversion canceled");
//         return null;
//       } else {
//         print("Conversion failed");
//         return null;
//       }
//     });
//   } catch (e) {
//     print("Error during conversion: $e");
//     return null;
//   }
//   return null;

//   // // Dapatkan direktori temporer
//   // final Directory tempDir = await getTemporaryDirectory();
//   // final String outputPath = "${tempDir.path}/output.wav";

//   // // Perintah konversi menggunakan FFmpeg
//   // final String command = '-i $inputPath $outputPath';

//   // // Jalankan perintah FFmpeg
//   // int rc = await _flutterFFmpeg.execute(command);
//   // if (rc == 0) {
//   //   print("Conversion successful: $outputPath");
//   //   return outputPath;
//   // } else {
//   //   print("Conversion failed with rc $rc");
//   //   return null;
//   // }
// }
// class AudioConverter {
//   static final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();

//   static Future<String?> convertM4AToWAV(String inputPath) async {
//     try {
//       final Directory tempDir = await getTemporaryDirectory();
//       final String outputPath = '${tempDir.path}/output.wav';

//       // Initialize FFmpeg
//       await _flutterFFmpeg.getFFmpegVersion();

//       // Command to convert M4A to WAV
//       final String command = '-i $inputPath $outputPath';

//       // Execute FFmpeg command
//       final int returnCode = await _flutterFFmpeg.execute(command);
//       if (returnCode == 0) {
//         // Check if the output file exists
//         final File outputFile = File(outputPath);
//         if (await outputFile.exists()) {
//           return outputPath;
//         } else {
//           return null;
//         }
//       } else {
//         return null;
//       }
//     } catch (e) {
//       debugPrint('Error converting file: $e');
//       return null;
//     }
//   }
// }

class _RecorderState extends State<Recorder> with AudioRecorderMixin {
  int _recordDuration = 0;
  Timer? _timer;
  late final AudioRecorder _audioRecorder;
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  // Amplitude? _amplitude;

  @override
  void initState() {
    _audioRecorder = AudioRecorder();

    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      _updateRecordState(recordState);
    });

    // _amplitudeSub = _audioRecorder.onAmplitudeChanged(const Duration(milliseconds: 300)).listen((amp) {
    //   // setState(() => _amplitude = amp);
    // });

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        const encoder = AudioEncoder.aacLc;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }

        final devs = await _audioRecorder.listInputDevices();
        debugPrint(devs.toString());

        const config = RecordConfig(encoder: encoder, numChannels: 1);

        // Record to file
        await recordFile(_audioRecorder, config);

        // Record to stream
        // await recordStream(_audioRecorder, config);

        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    if (path != null) {
      // Update the input filename to match the recorded file extension (m4a)
      FFmpegKit.execute('-i $path output.wav').then((session) async {
        final returnCode = await session.getReturnCode();
        if (ReturnCode.isSuccess(returnCode)) {
          // Konversi berhasil (Conversion successful)
          print('Konversi berhasil!');
          print('File WAV tersimpan di: $path');
        } else if (ReturnCode.isCancel(returnCode)) {
          // Konversi dibatalkan (Conversion cancelled)
          print('Konversi gagal!');
        } else {
          // Terjadi kesalahan (Error occurred)
        }
      });
    }
  }

  Future<void> _pause() => _audioRecorder.pause();

  Future<void> _resume() => _audioRecorder.resume();

  void _updateRecordState(RecordState recordState) {
    setState(() => _recordState = recordState);

    switch (recordState) {
      case RecordState.pause:
        _timer?.cancel();
        break;
      case RecordState.record:
        _startTimer();
        break;
      case RecordState.stop:
        _timer?.cancel();
        _recordDuration = 0;
        break;
    }
  }

  Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
    final isSupported = await _audioRecorder.isEncoderSupported(
      encoder,
    );

    if (!isSupported) {
      debugPrint('${encoder.name} is not supported on this platform.');
      debugPrint('Supported encoders are:');

      for (final e in AudioEncoder.values) {
        if (await _audioRecorder.isEncoderSupported(e)) {
          debugPrint('- ${encoder.name}');
        }
      }
    }

    return isSupported;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1179.w,
      height: 600.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 300.w, height: 300.w, child: _buildRecordStopControl()),
              // const SizedBox(width: 20),
              // _buildPauseResumeControl(),
              // const SizedBox(width: 20),
              _buildText(),
            ],
          ),
          // if (_amplitude != null) ...[
          //   // const SizedBox(height: 40),
          //   Text('Current: ${_amplitude?.current ?? 0.0}'),
          //   Text('Max: ${_amplitude?.max ?? 0.0}'),
          // ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = Icon(Icons.stop, color: MyColors.white, size: 120.sp);
      color = MyColors.primaryGreen;
    } else {
      icon = Icon(Icons.mic, color: MyColors.white, size: 120.sp);
      color = MyColors.primaryGreen;
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (_recordState == RecordState.record) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState == RecordState.pause) ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }

    return const Text("");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: MyColors.primaryGreen),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}

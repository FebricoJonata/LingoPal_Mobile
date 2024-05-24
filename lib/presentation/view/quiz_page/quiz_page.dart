import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/recorder/recorder_main.dart';
// import 'package:lingo_pal_mobile/presentation/view/quiz_page/recorder.dart';
// import 'package:lingo_pal_mobile/presentation/view/recorder/audio_recorder.dart';
// import 'package:lingo_pal_mobile/presentation/view/quiz_page/recorder.dart';
// import 'package:lingo_pal_mobile/presentation/view/recorder/recorder_main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.secondaryYellow,
      body: SizedBox(
        width: 1179.w,
        height: 2700.h,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            SizedBox(
              width: 1179.w,
              height: 1300.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetConstraints.robotQuiz),
                  Text(
                    "Its a sunny day",
                    style: TextStyle(color: MyColors.primaryGreen, fontSize: 100.sp),
                  )
                ],
              ),
            ),
            Flexible(child: Record())
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class Recorder {
//   FlutterSoundRecorder? _recorder;
//   bool _isRecorderInitialized = false;
//   String _fileName = 'myAudio.aac';
//   String _path = "/storage/emulated/0";

//   Future init() async {
//     _recorder = FlutterSoundRecorder();

//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw RecordingPermissionException('Recording permission required.');
//     }

//     await _recorder!.recorderState;
//     _isRecorderInitialized = true;
//   }

//   void _writeFileToStorage() async {
//     File audiofile = File('$_path/$_fileName');
//     Uint8List bytes = await audiofile.readAsBytes();
//     audiofile.writeAsBytes(bytes);
//   }

//   Future record() async {
//     if (!_isRecorderInitialized) {
//       return;
//     }
//     print('Recording...');
//     await _recorder!.startRecorder(
//       toFile: '$_fileName',
//     );
//   }

//   Future stop() async {
//     if (!_isRecorderInitialized) {
//       return;
//     }
//     await _recorder!.stopRecorder();
//     _writeFileToStorage();
//     print('Recording stopped.');
//   }

//   Future toggleRecording() async {
//     if (_recorder!.isStopped) {
//       await record();
//     } else {
//       await stop();
//     }
//   }

//   void dispose() {
//     // _recorder!.();
//     _recorder = null;
//     _isRecorderInitialized = false;
//   }
// }

// class QuizPage extends StatefulWidget {
//   const QuizPage({Key? key}) : super(key: key);

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   final Recorder _recorder = Recorder();

//   @override
//   void initState() {
//     super.initState();
//     _recorder.init();
//   }

//   @override
//   void dispose() {
//     _recorder.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.yellow, // Change to your desired background color
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Other widgets in your QuizPage
//           ElevatedButton(
//             onPressed: () {
//               _recorder.record();
//             },
//             child: Text('Record'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _recorder.stop();
//             },
//             child: Text('Stop'),
//           ),
//         ],
//       ),
//     );
//   }
// }

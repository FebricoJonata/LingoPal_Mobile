// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:lingo_pal_mobile/presentation/view/recorder/audio_player.dart';
// import 'package:lingo_pal_mobile/presentation/view/recorder/audio_recorder.dart';

// class Record extends StatefulWidget {
//   const Record({super.key});

//   @override
//   State<Record> createState() => _MyAppState();
// }

// class _MyAppState extends State<Record> {
//   bool showPlayer = false;
//   String? audioPath;

//   @override
//   void initState() {
//     showPlayer = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: showPlayer
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: AudioPlayer(
//                     source: audioPath!,
//                     onDelete: () {
//                       setState(() => showPlayer = false);
//                     },
//                   ),
//                 )
//               : Recorder(
//                   onStop: (path) {
//                     if (kDebugMode) print('Recorded file path: $path');
//                     setState(() {
//                       audioPath = path;
//                       showPlayer = true;
//                     });
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lingo_pal_mobile/presentation/view/recorder/audio_player.dart';
import 'package:lingo_pal_mobile/presentation/view/recorder/audio_recorder.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RecordBody(),
      ),
    );
  }
}

class RecordBody extends StatefulWidget {
  @override
  _RecordBodyState createState() => _RecordBodyState();
}

class _RecordBodyState extends State<RecordBody> {
  bool showPlayer = false;
  late String audioPath;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showPlayer
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AudioPlayer(
                source: audioPath,
                onDelete: () {
                  setState(() => showPlayer = false);
                },
              ),
            )
          : Recorder(
              onStop: (path) {
                if (kDebugMode) print('Recorded file path: $path');
                setState(() {
                  audioPath = path;
                  showPlayer = true;
                });
              },
            ),
    );
  }
}

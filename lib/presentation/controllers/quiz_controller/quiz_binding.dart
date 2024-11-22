import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/course_update.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/practice_update.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';

class QuizBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PronounQuizController());
    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => QuestionsController());
    Get.lazyPut(() => PracticeUpdateController());
    Get.lazyPut(() => CourseUpdateController());
  }
}

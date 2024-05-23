import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/pronoun_quiz.dart';

class QuizBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PronounQuizController());
  }
}

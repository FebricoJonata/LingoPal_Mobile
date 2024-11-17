import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/course_update.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/multiple_choice.dart';

class PracticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PracticeCourseController());
    Get.lazyPut(() => MultipleChoiceController());
    Get.lazyPut(() => CourseUpdateController());
  }
}

import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_course_API_controller.dart';

class PracticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PracticeCourseController());
  }
  
}
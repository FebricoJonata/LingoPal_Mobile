import 'package:get/get.dart';
// import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
// import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAPIController());
    // Get.lazyPut(() => CourseController());
    // Get.lazyPut(() => GetProfileController());
  }
}

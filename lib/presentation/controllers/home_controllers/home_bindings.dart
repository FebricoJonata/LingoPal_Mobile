import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/progress_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProfileController());
    Get.lazyPut(() => ProgressAPIController());
    Get.lazyPut(() => LoginAPIController());
  }
}

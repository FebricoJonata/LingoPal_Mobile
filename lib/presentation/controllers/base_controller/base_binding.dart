import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => LoginAPIController());
    Get.lazyPut(() => GetProfileController());
  }
}

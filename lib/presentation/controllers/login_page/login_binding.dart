import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAPIController());
  }
}

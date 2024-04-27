import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
  }
}

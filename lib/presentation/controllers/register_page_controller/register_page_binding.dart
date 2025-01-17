import 'package:get/get.dart';

import '../choice_chip_controller.dart';
import 'email_verif_controller.dart';
import 'register_API_controller.dart';

class RegisBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ChoicesController());
    Get.lazyPut(() => RegisterAPIController());
    Get.lazyPut(() => EmailVerifController());
  }
}

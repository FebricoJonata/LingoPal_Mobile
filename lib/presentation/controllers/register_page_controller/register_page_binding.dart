import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/email_verif_controller.dart';

import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/register_API_controller.dart';

class RegisBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ChoicesController());
    Get.lazyPut(() => RegisterAPIController());
    Get.lazyPut(() => EmailVerifController());
  }
}

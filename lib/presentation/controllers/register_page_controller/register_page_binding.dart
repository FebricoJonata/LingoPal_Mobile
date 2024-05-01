import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/page_view_controller.dart';

class RegisBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageViewRegisController());
    Get.lazyPut(() => ChoiceController());
  }
}

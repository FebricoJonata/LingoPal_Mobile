import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:lingo_pal_mobile/presentation/pages/landing_page/controller/page_view_controller.dart';

class LandingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageViewController());
  }
}

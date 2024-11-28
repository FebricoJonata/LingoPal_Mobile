import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/landing_page_controller/page_view_controller.dart';

class LandingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageViewController>(() => PageViewController());
  }
}

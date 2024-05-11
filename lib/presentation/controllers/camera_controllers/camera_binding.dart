import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/picker_controller.dart';

class CameraBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagePickerController());
  }
}

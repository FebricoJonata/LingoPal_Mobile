import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/picker_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/choice_chip_edit_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/edit_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAPIController());
    Get.lazyPut(() => GetProfileController());
    Get.lazyPut(() => ChoiceEditController());
    Get.lazyPut(() => EditAPIController());
    Get.lazyPut(() => ImagePickerController());
  }
}

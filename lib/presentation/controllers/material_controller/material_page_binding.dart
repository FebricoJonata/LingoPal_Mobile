import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/choice_chip_material_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/material_API_controller.dart';

class MaterialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoiceMaterialController());
    Get.lazyPut(() => MaterialController()); // atau mungkin disini
  }
}

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/choice_chip_material_controller.dart';
import 'package:lingo_pal_mobile/presentation/view/material_page/material_page.dart';

class MaterialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ChoiceMaterialController());
  }
  
}
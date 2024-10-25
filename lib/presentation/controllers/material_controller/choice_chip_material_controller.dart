import 'package:get/get.dart';
// ignore_for_file: file_names

class ChoiceMaterial {
  final int id;
  final String label;
  bool selected;

  ChoiceMaterial(this.id, this.label, this.selected);
}

class ChoiceMaterialController extends GetxController {
  // var controllerOption = Get.find<optionController>();
  final List<ChoiceMaterial> choices = [ChoiceMaterial(1, "All", true), ChoiceMaterial(2, "Article", false), ChoiceMaterial(3, "Video", false)];

  final Rx<ChoiceMaterial?> selectedChoice = Rx<ChoiceMaterial?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedChoice.value = choices[0];
  }

  void onSelected(ChoiceMaterial choice) {
    selectedChoice.value = choice;
    for (var item in choices) {
      item.selected = (item.id == choice.id); // if list choices id nya ada yg sama dengan selected choice id, maka selected menjadi true
    }
    // print(selectedChoice.value?.id);
    update();
  }

  int? getSelectedChoiceId() {
    return selectedChoice.value?.id;
  }
}

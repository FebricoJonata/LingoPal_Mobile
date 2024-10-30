import 'package:get/get.dart';
// ignore_for_file: file_names

class ChoiceMaterial {
  final int id;
  final String label;
  bool selected;
  ChoiceMaterial(this.id, this.label, this.selected);
}

class ChoiceMaterialController extends GetxController {
  final List<ChoiceMaterial> choices = [ChoiceMaterial(1, "All", true), ChoiceMaterial(2, "Article", false), ChoiceMaterial(3, "Video", false)];
  final Rx<ChoiceMaterial?> selectedChoice = Rx<ChoiceMaterial?>(null);

  @override
  void onInit() {
    super.onInit();
    selectedChoice.value = choices[0];
  }

  void onSelected(ChoiceMaterial choice) {
    selectedChoice.value = choice;
    for (var item in choices) {
      item.selected = (item.id == choice.id);
    }
    update();
  }

  int? getSelectedChoiceId() {
    return selectedChoice.value?.id;
  }
}

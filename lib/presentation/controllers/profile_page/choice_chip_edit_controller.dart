import 'package:get/get.dart';
// ignore_for_file: file_names

class ChoiceEdit {
  final int id;
  final String label;
  bool selected;

  ChoiceEdit(this.id, this.label, {this.selected = false});
}

class ChoiceEditController extends GetxController {
  // var controllerOption = Get.find<optionController>();
  final List<ChoiceEdit> choices = [ChoiceEdit(1, "Pria"), ChoiceEdit(2, "Wanita")];

  final Rx<ChoiceEdit?> selectedChoice = Rx<ChoiceEdit?>(null);

  void onSelected(ChoiceEdit choice) {
    selectedChoice.value = choice;
    for (var item in choices) {
      item.selected = (item.id == choice.id);
    }
    // print(selectedChoice.value?.id);
    update();
  }

  int? getSelectedChoiceId() {
    return selectedChoice.value?.id;
  }
}

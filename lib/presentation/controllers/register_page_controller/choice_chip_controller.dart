import 'package:get/get.dart';
// ignore_for_file: file_names

class Choice {
  final int id;
  final String label;
  bool selected;

  Choice(this.id, this.label, {this.selected = false});
}

class ChoiceController extends GetxController {
  // var controllerOption = Get.find<optionController>();
  final List<Choice> choices = [Choice(1, "Pria"), Choice(2, "Wanita")];

  final Rx<Choice?> selectedChoice = Rx<Choice?>(null);

  void onSelected(Choice choice) {
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

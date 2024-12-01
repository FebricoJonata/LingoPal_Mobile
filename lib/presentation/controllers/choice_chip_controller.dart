// import 'package:get/get.dart';

// class Choices {
//   final int id;
//   final String label;
//   bool selected;
//   Choices(this.id, this.label, this.selected);
// }

// class ChoicesController extends GetxController {
//   final RxList<Choices> choices = <Choices>[].obs;
//   final Rx<Choices?> selectedChoice = Rx<Choices?>(null);

//   void setChoices(List<Choices> newChoices) {
//     choices.assignAll(newChoices);
//     selectedChoice.value = choices.first;
//   }

//   void onSelected(Choices choice) {
//     selectedChoice.value = choice;
//     for (var item in choices) {
//       item.selected = (item.id == choice.id);
//     }
//   }

//   int? getSelectedChoiceId() {
//     return selectedChoice.value?.id;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choices {
  final int id;
  final String label; // Label untuk tampilan
  final String value; // Nilai asli untuk dikirim
  bool selected;

  Choices(this.id, this.label, this.value, this.selected);
}

class ChoicesController extends GetxController {
  final RxList<Choices> choices = <Choices>[].obs;
  final Rx<Choices?> selectedChoice = Rx<Choices?>(null);

  void setChoices(List<Choices> newChoices) async {
    choices.assignAll(newChoices);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedChoice.value = choices.first;
    });
  }

  void onSelected(Choices choice) {
    selectedChoice.value = choice;
    for (var item in choices) {
      item.selected = (item.id == choice.id);
    }
  }

  int? getSelectedChoiceId() {
    return selectedChoice.value?.id;
  }
}

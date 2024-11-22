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
import 'package:lingo_pal_mobile/routes/name_page.dart';

class Choices {
  final int id;
  final String label;
  bool selected;
  Choices(this.id, this.label, this.selected);
}

class ChoicesController extends GetxController {
  final RxList<Choices> choices = <Choices>[].obs;
  final Rx<Choices?> selectedChoice = Rx<Choices?>(null);

  void setChoices(List<Choices> newChoices) async {
    // choices.assignAll(newChoices);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   selectedChoice.value = choices.first;
    // });  print("New choices: $newChoices"); // Debugging
    if (newChoices.isEmpty) {
      print("Error: No new choices provided.");
      return;
    }
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

  @override
  void onInit() {
    super.onInit();
    if (Get.currentRoute == RouteName.registerPage) {
      final List<Choices> pageChoices = [
        Choices(1, "Male", false),
        Choices(2, "Female", false),
      ];
      setChoices(pageChoices);
    }
  }
}

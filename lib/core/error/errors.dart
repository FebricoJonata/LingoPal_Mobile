import 'package:get/get.dart';

import '../../presentation/view/components/alert.dart';

void showError(int? statusCode, String? message) {
  String errorMessage;

  if (statusCode == 401) {
    errorMessage = "Unauthorized access. Please check your credentials.";
  } else if (statusCode == 404) {
    errorMessage = "Resource not found. Please try again later.";
  } else if (statusCode == 500) {
    errorMessage = "Internal server error. Please contact support.";
  } else if (statusCode == 400) {
    errorMessage = "Bad request. Please check your input.";
  } else {
    errorMessage = message ?? "An unexpected error occurred.";
  }

  Get.dialog(
    Alert(
      imagePath: "assets/images/robots/cool.png",
      title: "Error $statusCode!",
      message: errorMessage,
      onClose: () async {
        Get.back();
      },
    ),
  );
}

import 'package:get/get.dart';

import '../../presentation/view/components/alert.dart';

void showError(int? statusCode, String? message) {
  String errorMessage;
  String errorTitle;
  if (statusCode == 401) {
    errorTitle = "Unauthorized!";
    errorMessage = "Unauthorized access. Please check your credentials.";
  } else if (statusCode == 402) {
    errorTitle = "Not verified!";
    errorMessage = "Please check your email to verify account first.";
  } else if (statusCode == 404) {
    errorTitle = "Not found!";
    errorMessage = "Resource not found. Please try again later.";
  } else if (statusCode == 500) {
    errorTitle = "Unexpectd Error";
    errorMessage = "Internal server error. Please contact support.";
  } else if (statusCode == 400) {
    errorTitle = "Bad Request";
    errorMessage = "Bad request. Please check your input.";
  } else {
    errorTitle = "Alert!";
    errorMessage = message ?? "An unexpected error occurred.";
  }

  Get.dialog(
    Alert(
      imagePath: "assets/images/robots/cool.png",
      title: errorTitle,
      message: errorMessage,
      onClose: () async {
        Get.back();
      },
    ),
  );
}

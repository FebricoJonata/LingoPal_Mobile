import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';

class Alert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  final String imagePath;

  const Alert({
    Key? key,
    required this.title,
    required this.message,
    required this.onClose,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: MyColors.secondaryYellow,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: MyColors.grey,
                offset: Offset(0, 4),
                blurRadius: 18,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                imagePath,
                width: 100, // Adjust size as needed
                height: 100, // Adjust size as needed
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(MyColors.primaryGreen),
                  ),
                  onPressed: onClose,
                  child: Text(
                    'close'.tr,
                    style: const TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';

class EmailAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  final String imagePath;
  final VoidCallback? onPressed;
  final String buttonText;
  const EmailAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.onClose,
    required this.imagePath,
    this.onPressed,
    required this.buttonText,
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
          width: 1200.w,
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
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(MyColors.primaryGreen),
                      ),
                      onPressed: onClose,
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50.w),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(MyColors.secondaryGreen),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

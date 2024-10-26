import 'package:flutter/material.dart';

class ReuseTextField extends StatelessWidget {
  const ReuseTextField({
    super.key,
    required this.iconTxt,
    required this.labelTxt,
    required this.color,
    required this.radius,
    required this.linesMax,
    required this.linesMin,
    required this.maxHeight,
    required this.width,
    required this.fontSize,
    required this.iconSize,
    this.onChanged,
    required this.obscureText,
    this.onPressed,
    this.controller,
    this.height,
    this.textInputType,
    this.validator,
    this.autovalidateMode,
  });
  final IconData iconTxt;
  final String labelTxt;
  final int linesMax;
  final int linesMin;
  final double maxHeight;
  final double width;
  final Color color;
  final double radius;
  final double fontSize;
  final double iconSize;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final double? height;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          minLines: linesMin,
          maxLines: linesMax,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide.none),
            fillColor: color,
            filled: true,
            hintText: labelTxt,
            alignLabelWithHint: true,
            hintStyle: TextStyle(fontSize: fontSize, color: const Color.fromARGB(255, 199, 201, 217)),
            contentPadding: EdgeInsets.symmetric(vertical: (maxHeight - fontSize) / 2),
            prefixIcon: SizedBox(
              width: iconSize,
              height: iconSize,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    iconTxt,
                    size: iconSize,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

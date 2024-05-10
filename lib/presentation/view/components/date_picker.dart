import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.labelTxt,
    required this.iconTxt,
    this.onChanged,
    required this.linesMax,
    required this.linesMin,
    required this.maxHeight,
    required this.width,
    required this.color,
    required this.radius,
    required this.fontSize,
    required this.iconSize,
    required this.obscureText,
    this.onPressed,
    this.controller,
    // required this.optionColorCourier,
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
  @override
  State<DatePicker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DatePicker> {
  // final fieldController = Get.put(onChangeField());
  TextEditingController? datePickerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    datePickerController = widget.controller ?? TextEditingController();
    // datePickerController = TextEditingController(); // Inisialisasi datePickerController di initState
  }

  void _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    setState(() {
      datePickerController!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: widget.maxHeight),
        child: TextField(
          controller: datePickerController,
          obscureText: widget.obscureText,
          minLines: widget.linesMin,
          maxLines: widget.linesMax,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius), borderSide: BorderSide.none),
            fillColor: widget.color,
            filled: true,
            hintText: widget.labelTxt,
            alignLabelWithHint: true,
            hintStyle: TextStyle(fontSize: widget.fontSize, color: const Color.fromARGB(255, 199, 201, 217)),
            contentPadding: EdgeInsets.symmetric(vertical: (widget.maxHeight - widget.fontSize) / 2),
            prefixIcon: SizedBox(
              width: widget.iconSize,
              height: widget.iconSize,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    widget.iconTxt,
                    size: widget.iconSize,
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

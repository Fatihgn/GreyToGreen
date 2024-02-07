import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {required this.icon,
      required this.keyboard,
      required this.text,
      required this.maxlength,
      required this.textController,
      super.key});

  final String text;
  final int maxlength;
  final Icon icon;
  final TextInputType keyboard;
  final TextEditingController textController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: widget.keyboard,
      maxLines: (widget.maxlength >= 100) ? 3 : 1,
      maxLength: widget.maxlength,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: widget.icon,
        label: Text(
          widget.text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}

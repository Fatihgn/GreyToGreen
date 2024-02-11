import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {required this.prefixicon,
      required this.hintText,
      required this.textController,
      super.key});

  final String hintText;
  final Icon prefixicon;
  final TextEditingController textController;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: widget.textController,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: const Color.fromARGB(255, 250, 243, 243),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: widget.prefixicon,
          hintText: widget.hintText,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}

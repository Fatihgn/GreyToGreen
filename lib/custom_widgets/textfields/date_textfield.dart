import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  const DateTextField(
      {required this.text, required this.dateController, super.key});

  final String text;
  final TextEditingController dateController;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  DateTime? selectedDate;

  void dateSelector() async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = DateTime(now.year, now.month + 1, now.day);

    final date = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);

    if (date == null) {
      return;
    }

    setState(() {
      selectedDate = date;
      widget.dateController.text = DateFormat.yMd().format(selectedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: false,
      enableInteractiveSelection: false,
      controller: widget.dateController,
      onTap: dateSelector,
      keyboardType: TextInputType.none,
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
        label: Text(widget.text, style: Theme.of(context).textTheme.labelLarge),
        suffixIcon: const Icon(Icons.calendar_month),
      ),
    );
  }
}

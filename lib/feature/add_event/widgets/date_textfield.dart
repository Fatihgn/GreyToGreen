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
  DateTimeRange? selectedDate;

  void dateSelector() async {
    final now = DateTime.now();

    final date = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, now.month + 1, now.day),
    );

    if (date == null) {
      return;
    }

    setState(() {
      selectedDate = date;
      widget.dateController.text =
          '${DateFormat.yMMMd().format(selectedDate!.start)} - ${DateFormat.yMMMd().format(selectedDate!.end)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
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
          label:
              Text(widget.text, style: Theme.of(context).textTheme.labelLarge),
          suffixIcon: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }
}

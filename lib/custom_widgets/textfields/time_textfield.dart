import 'package:flutter/material.dart';

class TimeTextField extends StatefulWidget {
  const TimeTextField(
      {required this.text, required this.timeController, super.key});

  final String text;
  final TextEditingController timeController;

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  TimeOfDay? selectedTime;

  void timeSelector() async {
    final now = TimeOfDay.now();
    final time = await showTimePicker(context: context, initialTime: now);

    if (time == null) {
      return;
    }

    setState(() {
      selectedTime = time;
      widget.timeController.text = selectedTime!.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.timeController,
      showCursor: false,
      enableInteractiveSelection: false,
      onTap: timeSelector,
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
        suffixIcon: const Icon(Icons.access_time_filled_sharp),
      ),
    );
  }
}

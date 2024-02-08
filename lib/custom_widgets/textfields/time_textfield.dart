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
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  void timeSelector() async {
    final now = TimeOfDay.now();
    final startTime = await showTimePicker(context: context, initialTime: now);

    if (startTime == null) {
      return;
    }

    setState(() {
      selectedStartTime = startTime;
    });

    final endTime =
        await showTimePicker(context: context, initialTime: startTime);

    if (endTime == null) {
      return;
    }

    if (endTime.hour < startTime.hour ||
        (endTime.hour == startTime.hour && endTime.minute < startTime.minute)) {
      // Handle invalid end time selection:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('End time must be after start time.'),
        ),
      );
      return;
    }

    setState(() {
      selectedEndTime = endTime;
      widget.timeController.text =
          '${selectedStartTime!.format(context)} - ${selectedEndTime!.format(context)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
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
          label:
              Text(widget.text, style: Theme.of(context).textTheme.labelLarge),
          suffixIcon: const Icon(Icons.access_time_filled_sharp),
        ),
      ),
    );
  }
}

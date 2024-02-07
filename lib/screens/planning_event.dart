import 'package:flutter/material.dart';
import 'package:grey_to_green/custom_widgets/textfields/date_textfield.dart';
import 'package:grey_to_green/custom_widgets/textfields/basic_textfield.dart';
import 'package:grey_to_green/custom_widgets/textfields/time_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grey_to_green/models/event.dart';
import 'package:grey_to_green/models/data/events.dart';

class PlanEvent extends StatefulWidget {
  const PlanEvent({super.key});

  @override
  State<PlanEvent> createState() => _PlanEventState();
}

class _PlanEventState extends State<PlanEvent> {
  XFile? _selectedEventImage;
  final titleController = TextEditingController();
  final aboutController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final participantController = TextEditingController();

  var category = categories[0];

  @override
  void dispose() {
    titleController.dispose();
    aboutController.dispose();
    locationController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    participantController.dispose();
    super.dispose();
  }

  void planEvent() {
    final maxParticipant = double.tryParse(participantController.text);

    if (titleController.text.trim().isEmpty ||
        aboutController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.trim().isEmpty ||
        startTimeController.text.trim().isEmpty ||
        endTimeController.text.trim().isEmpty ||
        maxParticipant! <= 0 ||
        participantController.text.isEmpty ||
        _selectedEventImage == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Missing Information'),
          content: const Text('Please fill in all blank fields !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okey'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      clenaupEvents.add(
        Event(
          title: titleController.text,
          location: locationController.text,
          startEventDate: startDateController.text,
          endEventDate: endDateController.text,
          startEventTime: startTimeController.text,
          endEventTime: endTimeController.text,
          about: aboutController.text,
          eventImage: _selectedEventImage!,
          maxParticipant: int.parse(participantController.text),
        ),
      );
    });
  }

  void _eventImageFunc() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    setState(() {
      _selectedEventImage = image;
    });
  }

  void _canceImage() {
    setState(() {
      _selectedEventImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              text: 'Title',
              maxlength: 50,
              icon: const Icon(Icons.title_outlined),
              keyboard: TextInputType.text,
              textController: titleController,
            ),
            CustomTextField(
              text: 'About',
              maxlength: 100,
              icon: const Icon(Icons.question_mark_outlined),
              keyboard: TextInputType.text,
              textController: aboutController,
            ),
            CustomTextField(
              text: 'Location',
              maxlength: 20,
              icon: const Icon(Icons.location_on),
              keyboard: TextInputType.text,
              textController: locationController,
            ),
            Row(
              children: [
                Expanded(
                  child: DateTextField(
                    text: 'Start Event Date',
                    dateController: startDateController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DateTextField(
                    text: 'End Event Date',
                    dateController: endDateController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TimeTextField(
                    text: 'Start Event Time',
                    timeController: startTimeController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TimeTextField(
                    text: 'End Event Time',
                    timeController: endTimeController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    text: 'Max Participant',
                    icon: const Icon(Icons.people_alt),
                    maxlength: 5,
                    keyboard: TextInputType.number,
                    textController: participantController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_selectedEventImage == null)
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _eventImageFunc,
                    label: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 23, horizontal: 7),
                      child: Text(
                        'Event Image',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    icon: const Icon(
                      Icons.image,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  )
                else
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(_selectedEventImage!.name.toString()),
                      ),
                      IconButton(
                        onPressed: _canceImage,
                        icon: const Icon(Icons.delete_forever_rounded),
                      ),
                    ],
                  ),
              ],
            ),
            DropdownButton(
              value: category,
              dropdownColor: const Color.fromARGB(255, 250, 243, 243),
              style: const TextStyle(color: Colors.black),
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              items: [
                for (var item in categories)
                  DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (newValue) {
                if (newValue == null) {
                  return;
                }
                setState(() {
                  category = newValue;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: planEvent,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'PLAN EVENT',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

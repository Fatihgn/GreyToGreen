import 'package:flutter/material.dart';
import 'package:grey_to_green/custom_widgets/textfields/date_textfield.dart';
import 'package:grey_to_green/custom_widgets/textfields/basic_textfield.dart';
import 'package:grey_to_green/custom_widgets/textfields/time_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grey_to_green/models/event.dart';
import 'package:grey_to_green/models/data/events.dart';

/// Plan Event Screen
class PlanEvent extends StatefulWidget {
  /// Constructor
  const PlanEvent({super.key});

  @override
  State<PlanEvent> createState() => _PlanEventState();
}

class _PlanEventState extends State<PlanEvent> {
  XFile? _selectedEventImage;
  final titleController = TextEditingController();
  final aboutController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final participantController = TextEditingController();

  String category = categories[0];

  @override
  void dispose() {
    titleController.dispose();
    aboutController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    participantController.dispose();
    super.dispose();
  }

  void planEvent() {
    final maxParticipant = double.tryParse(participantController.text);

    if (titleController.text.trim().isEmpty ||
        aboutController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        dateController.text.isEmpty ||
        timeController.text.trim().isEmpty ||
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
          eventDate: dateController.text,
          eventTime: timeController.text,
          about: aboutController.text,
          eventImage: _selectedEventImage!,
          maxParticipant: int.parse(participantController.text),
        ),
      );
    });
  }

  Future<void> _eventImageFunc() async {
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
          children: [
            CustomTextField(
              text: 'Title',
              icon: const Icon(Icons.title_outlined),
              keyboard: TextInputType.text,
              textController: titleController,
            ),
            CustomTextField(
              text: 'About',
              icon: const Icon(Icons.question_mark_outlined),
              keyboard: TextInputType.text,
              textController: aboutController,
            ),
            CustomTextField(
              text: 'Location',
              icon: const Icon(Icons.location_on),
              keyboard: TextInputType.text,
              textController: locationController,
            ),
            DateTextField(
              text: 'Event Date',
              dateController: dateController,
            ),
            const SizedBox(
              width: 10,
            ),
            TimeTextField(
              text: 'Event Time',
              timeController: timeController,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    text: 'Max Participant',
                    icon: const Icon(Icons.people_alt),
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
                        vertical: 23,
                        horizontal: 7,
                      ),
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
                        child: Text(_selectedEventImage!.name),
                      ),
                      IconButton(
                        onPressed: _canceImage,
                        icon: const Icon(Icons.delete_forever_rounded),
                      ),
                    ],
                  ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: const Color.fromARGB(255, 70, 70, 70)),
              ),
              child: DropdownButton(
                underline: Container(),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                isExpanded: true,
                value: category,
                items: [
                  for (final item in categories)
                    DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                ],
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    category = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: planEvent,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Plan Event',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grey_to_green/feature/add_event/widgets/basic_textfield.dart';
import 'package:grey_to_green/feature/add_event/widgets/date_textfield.dart';
import 'package:grey_to_green/feature/add_event/widgets/time_textfield.dart';
import 'package:grey_to_green/feature/home/widgets/colors.dart';
import 'package:grey_to_green/models/data/events.dart';
import 'package:grey_to_green/models/event.dart';
import 'package:grey_to_green/models/location.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()

/// Plan Event Screen
class PlanEventScreen extends StatefulWidget {
  /// Constructor
  const PlanEventScreen({super.key});

  @override
  State<PlanEventScreen> createState() => _PlanEventScreenState();
}

class _PlanEventScreenState extends State<PlanEventScreen> {
  XFile? _selectedEventImage;
  final titleController = TextEditingController();
  final aboutController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final participantController = TextEditingController();

  String category = categories[0];

  var start;
  Future<void> planEvent() async {
    final maxParticipant = double.tryParse(participantController.text);

    if (titleController.text.trim().isEmpty ||
        aboutController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        dateController.text.isEmpty ||
        timeController.text.trim().isEmpty ||
        maxParticipant! <= 0 ||
        participantController.text.isEmpty ||
        _selectedEventImage == null) {
      await showDialog(
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
    start = await locationFromAddress(locationController.text);

    setState(() {
      clenaupEvents.add(
        Event(
          title: titleController.text,
          location: MyLocation(
            name: locationController.text,
            latitude: double.tryParse(start[0].latitude.toString())!,
            longitude: double.tryParse(start[0].longitude.toString())!,
          ),
          eventDate: dateController.text,
          eventTime: timeController.text,
          about: aboutController.text,
          eventImage: _selectedEventImage!,
          maxParticipant: int.parse(participantController.text),
          category: category,
        ),
      );

      titleController.clear();
      locationController.clear();
      dateController.clear();
      timeController.clear();
      aboutController.clear();
      participantController.clear();
      _selectedEventImage = null;
    });
  }

  Future<void> planFakeEvent() async {
    final maxParticipant = double.tryParse(participantController.text);

    if (titleController.text.trim().isEmpty ||
        aboutController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        dateController.text.isEmpty ||
        timeController.text.trim().isEmpty ||
        maxParticipant! <= 0 ||
        participantController.text.isEmpty ||
        _selectedEventImage == null) {
      await showDialog(
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
    start = await locationFromAddress(locationController.text);

    setState(() {
      fakeEvents.add(
        Event(
          title: titleController.text,
          location: MyLocation(
            name: locationController.text,
            latitude: double.tryParse(start[0].latitude.toString())!,
            longitude: double.tryParse(start[0].longitude.toString())!,
          ),
          eventDate: dateController.text,
          eventTime: timeController.text,
          about: aboutController.text,
          eventImage: _selectedEventImage!,
          maxParticipant: int.parse(participantController.text),
          category: category,
        ),
      );

      titleController.clear();
      locationController.clear();
      dateController.clear();
      timeController.clear();
      aboutController.clear();
      participantController.clear();
      _selectedEventImage = null;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          AppColors.primary,
        ),
        title: const Text(
          'Plan Events',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
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
                  border: Border.all(
                    color: const Color.fromARGB(255, 70, 70, 70),
                  ),
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
                    backgroundColor: const Color(
                      AppColors.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'Plan Event',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

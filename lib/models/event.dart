import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

final List<String> categories = [
  'Enviormental Clenup',
  'Trekking and Excursions',
  'Tree Planting',
  'Natural Habitat Restoration',
  'Cleaning local water sources',
];

final categoryIcons = {
  categories[0]: Icons.cleaning_services_outlined,
  categories[1]: Icons.directions_bus_filled_outlined,
  categories[2]: Icons.forest_outlined,
  categories[3]: Icons.restart_alt_outlined,
  categories[4]: Icons.water,
};

class Event {
  Event({
    required this.title,
    required this.location,
    required this.startEventDate,
    required this.endEventDate,
    required this.startEventTime,
    required this.endEventTime,
    required this.about,
    required this.eventImage,
    required this.maxParticipant,
  });

  final String title;
  final String location;
  final String startEventDate;
  final String endEventDate;
  final String startEventTime;
  final String endEventTime;
  final String about;
  final XFile eventImage;
  final int maxParticipant;
}

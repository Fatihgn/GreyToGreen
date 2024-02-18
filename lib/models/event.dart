import 'package:flutter/material.dart';
import 'package:grey_to_green/models/location.dart';
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
    required this.eventDate,
    required this.eventTime,
    required this.about,
    required this.eventImage,
    required this.maxParticipant,
    required this.category,
  });

  final String title;
  final MyLocation location;
  final String eventDate;
  final String eventTime;
  final String about;
  final XFile eventImage;
  final int maxParticipant;
  final String category;
}

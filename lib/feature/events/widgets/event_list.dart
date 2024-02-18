import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/events/widgets/event_item.dart';
import 'package:grey_to_green/models/event.dart';

class EventList extends StatelessWidget {
  const EventList({
    required this.categoryName,
    required this.currentEvents,
    super.key,
  });

  final List<Event> currentEvents;
  final String categoryName;

  List<Event> get selectedEvents {
    return currentEvents
        .where((element) => element.category == categoryName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedEvents.length,
      itemBuilder: (ctx, index) => (selectedEvents.isNotEmpty)
          ? EventItem(selectedEvents[index])
          : const Text('No Events yet!'),
    );
  }
}

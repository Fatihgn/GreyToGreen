import 'package:flutter/material.dart';
import 'package:grey_to_green/custom_widgets/event_view/event_item.dart';
import 'package:grey_to_green/models/event.dart';

class EventList extends StatelessWidget {
  const EventList(this.currentEvents, {super.key});

  final List<Event> currentEvents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentEvents.length,
      itemBuilder: (ctx, index) => EventItem(currentEvents[index]),
    );
  }
}

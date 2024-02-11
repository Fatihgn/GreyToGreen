import 'package:auto_route/auto_route.dart';
import 'package:grey_to_green/feature/events/widgets/event_list.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/models/data/events.dart';

@RoutePage()
class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    Widget currentEvents = Center(
      child: Text(
        'No events yet :(',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );

    if (clenaupEvents.isNotEmpty) {
      currentEvents = Expanded(child: EventList(clenaupEvents));
    }

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      child: currentEvents,
    );
  }
}

import 'package:grey_to_green/custom_widgets/event_view/event_list.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/models/data/events.dart';

class CurrentEvents extends StatefulWidget {
  const CurrentEvents({super.key});

  @override
  State<CurrentEvents> createState() => _CurrenEventsState();
}

class _CurrenEventsState extends State<CurrentEvents> {
  @override
  Widget build(BuildContext context) {
    Widget currentEvents = Center(
        child: Text(
      'No events yet :(',
      style: Theme.of(context).textTheme.bodyLarge,
    ));

    if (clenaupEvents.isNotEmpty) {
      currentEvents = Expanded(child: EventList(clenaupEvents));
    }

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      child: currentEvents,
    );
  }
}

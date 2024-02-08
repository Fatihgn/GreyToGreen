import 'package:flutter/material.dart';
import 'package:grey_to_green/models/event.dart';
import 'dart:io';

class EventItem extends StatelessWidget {
  const EventItem(this.event, {super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color.fromRGBO(183, 183, 183, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 7, left: 7, top: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(event.eventImage.path),
                width: screenwidth,
                height: screenwidth / 2,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                const Icon(Icons.location_on_outlined, size: 23),
                Text(
                  event.location,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${event.eventDate} | ${event.eventTime}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.handshake_outlined),
                Text('${0}/${event.maxParticipant} Volunteers Required'),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      //! Icon dinamik olucak
                      Icons.bookmark_added_outlined,
                      //! Icon rengi dinamik
                      color: Color.fromRGBO(99, 210, 69, 1),
                    ),
                    //! Text dinamik olucak
                    label: Text('Attended',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              //! Text rengi dinamik
                              color: const Color.fromRGBO(99, 210, 69, 1),
                            ))),
              ],
            ),
            SizedBox(
              width: screenwidth / 2,
              child: const LinearProgressIndicator(
                backgroundColor: Color.fromRGBO(223, 223, 223, 1),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                //! value dinamik olucak
                value: 126 / 400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

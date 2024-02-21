import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/home/widgets/colors.dart';
import 'package:grey_to_green/main.dart';
import 'package:grey_to_green/models/event.dart';
import 'dart:io';

class EventItem extends StatefulWidget {
  const EventItem(this.event, {super.key});

  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      elevation: 10,
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
                File(widget.event.eventImage.path),
                width: screenwidth,
                height: screenwidth / 2,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              widget.event.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 23),
                SizedBox(
                  width: screenwidth / 1.3,
                  child: Text(
                    widget.event.location.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.event.eventDate} | ${widget.event.eventTime}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.handshake_outlined),
                Text(
                  '${0}/${widget.event.maxParticipant} Volunteers Required',
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    widget.event.isAttended
                        ? Icons.bookmark_added_rounded
                        : Icons.bookmark_add_rounded,
                    color: Color(
                      widget.event.isAttended
                          ? AppColors.primary
                          : AppColors.secondary,
                    ),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.event.isAttended = !widget.event.isAttended;
                    });
                  },
                ),
                Text(
                  widget.event.isAttended ? 'Attended' : 'Attend',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      widget.event.isAttended
                          ? AppColors.primary
                          : AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenwidth / 2,
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                //! value dinamik olucak
                value: widget.event.attendedParticipant /
                    widget.event.maxParticipant,
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

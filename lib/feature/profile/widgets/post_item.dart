import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grey_to_green/models/data/events.dart';
import 'package:grey_to_green/models/event.dart';
import 'package:grey_to_green/feature/profile/widgets/container_in_profile.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    final futureAttendedEvents =
        clenaupEvents.where((element) => element.isAttended == true).toList();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 170,
      ),
      itemCount: futureAttendedEvents.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              context: context,
              builder: (context) => const ContainerInProfile(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
            ),
            child: Image.file(
              File(futureAttendedEvents[index].eventImage.path),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

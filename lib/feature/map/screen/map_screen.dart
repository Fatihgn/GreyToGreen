import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:grey_to_green/feature/home/widgets/colors.dart';
import 'package:grey_to_green/models/data/events.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import 'package:grey_to_green/models/location.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool anyLocationClicked = false;

  List<Marker> getMarkers() {
    return List<Marker>.from(
      clenaupEvents.map(
        (e) => Marker(
          point: LatLng(e.location.latitude, e.location.longitude),
          child: InkWell(
            onTap: () {
              setState(() {
                anyLocationClicked = true;
                eventName = e.title;
                eventDate = e.eventDate;
                eventTime = e.eventTime;
                eventLocation = e.location.name;
                event_latitude = e.location.latitude;
                event_longitude = e.location.longitude;
                eventImages = e.eventImage;
                mapController.move(
                  LatLng(e.location.latitude, e.location.longitude),
                  12,
                );
              });
            },
            child: const SizedBox(
              width: 35,
              height: 35,
              child: Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool attend = false;
  String eventName = '';
  String eventTime = '';
  String eventDate = '';
  XFile? eventImages;
  String eventLocation = '';
  double event_latitude = 20;
  double event_longitude = 20;
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final screenWidthSize = MediaQuery.of(context).size.width;
    final screenHeightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          AppColors.primary,
        ),
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: const MapOptions(
                center: LatLng(40.71232119679743, 31.512404769882224),
                zoom: 12,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                (clenaupEvents.isNotEmpty
                    ? MarkerLayer(
                        markers: getMarkers(),
                      )
                    : Container()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (clenaupEvents.isNotEmpty)
                    ? (anyLocationClicked == false)
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: screenWidthSize / 1.2,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    width: screenWidthSize / 2.5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        File(eventImages!.path),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidthSize / 2.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          eventName,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '$eventDate   $eventTime',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          eventLocation,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                attend
                                                    ? Icons
                                                        .bookmark_added_rounded
                                                    : Icons
                                                        .bookmark_add_rounded,
                                                color: Color(
                                                  attend
                                                      ? AppColors.primary
                                                      : AppColors.secondary,
                                                ),
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  attend = !attend;
                                                });
                                              },
                                            ),
                                            Text(
                                              attend ? 'Attended' : 'Attend',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(
                                                  attend
                                                      ? AppColors.primary
                                                      : AppColors.secondary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/home/widgets/colors.dart';
import 'package:grey_to_green/models/data/events.dart';
import 'package:grey_to_green/models/event.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool pastEvent = true;
  bool attend = false;

  Event homeEvent = fakeEvents[0];
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidthSize = MediaQuery.of(context).size.width;
    final screenHeightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(
        AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/applogo.png'),
                        radius: 20,
                        backgroundColor: Color(
                          AppColors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/D4D03AQHk9VEJad9ODg/profile-displayphoto-shrink_400_400/0/1685731084517?e=1714003200&v=beta&t=fHTKR589TPgC-k82OawZ13rYxwMeEyP4FR8_VpTvg1E',
                        ),
                        radius: 30,
                        backgroundColor: Color(
                          AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mehmet Fatih',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(
                              pastEvent
                                  ? AppColors.primary
                                  : AppColors.secondary,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              pastEvent = true;
                              homeEvent = fakeEvents[0];
                            });
                          },
                          child: const Text(
                            'Past Event',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidthSize * 0.05,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              pastEvent = false;
                              homeEvent = clenaupEvents[0];
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Color(
                              pastEvent
                                  ? AppColors.secondary
                                  : AppColors.primary,
                            ),
                          ),
                          child: const Text(
                            'Upcoming Event',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                    color: const Color(
                      AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: screenWidthSize,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://static-00.iconduck.com/assets.00/profile-default-icon-512x511-v4sw4m29.png',
                              ),
                              radius: 30,
                              backgroundColor: Color(
                                AppColors.primary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: screenWidthSize / 2.3,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Volunteer',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(
                                          AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                int random;
                                if (pastEvent) {
                                  do {
                                    random =
                                        Random().nextInt(fakeEvents.length);
                                  } while (random == temp);
                                  temp = random;
                                  setState(() {
                                    homeEvent = fakeEvents[random];
                                  });
                                } else {
                                  do {
                                    random =
                                        Random().nextInt(fakeEvents.length);
                                  } while (random == temp);
                                  temp = random;
                                  setState(() {
                                    homeEvent = clenaupEvents[random];
                                  });
                                }
                              },
                              child: const Text(
                                'Change',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(homeEvent.eventImage.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          homeEvent.title,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          color: Color(
                            AppColors.primary,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: screenWidthSize / 1.5,
                              child: Text(
                                homeEvent.location.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: pastEvent
                              ? null
                              : Text(
                                  '${homeEvent.eventDate} | ${homeEvent.eventTime}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                        Container(
                          width: screenWidthSize,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              pastEvent
                                  ? homeEvent.about
                                  : '${homeEvent.maxParticipant} Voluneteers Required',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        if (pastEvent)
                          Container()
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  attend
                                      ? Icons.bookmark_added_rounded
                                      : Icons.bookmark_add_rounded,
                                  color: Color(
                                    attend
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                  size: 30,
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
                                  fontSize: 20,
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
          ),
        ),
      ),
    );
  }
}

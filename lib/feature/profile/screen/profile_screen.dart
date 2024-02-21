import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/profile/widgets/post_item.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool buttonClicked = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/forest.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight / 1.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 247, 246),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 25,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: screenWidth / 8,
                                backgroundImage: const AssetImage(
                                  'assets/images/applogo.png',
                                ),
                              ),
                              Container(
                                width: screenWidth / 1.7,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Görkem Enes İNCİ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Volunteer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Gender',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Age',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Location',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 25,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Male',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontStyle: FontStyle.normal),
                                  ),
                                  Text(
                                    '22',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontStyle: FontStyle.normal),
                                  ),
                                  Text(
                                    'Türkiye',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontStyle: FontStyle.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        buttonClicked = true;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: buttonClicked
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    child: Text(
                                      'Upcoming Events',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        buttonClicked = false;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: (!buttonClicked)
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    child: Text(
                                      'Attended Events',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Grid(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

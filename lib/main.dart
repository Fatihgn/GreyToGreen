import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grey_to_green/product/init/application_initialize.dart';
import 'package:grey_to_green/product/init/theme/custom_color_scheme.dart';
import 'package:grey_to_green/product/init/theme/custom_light_theme.dart';
import 'package:grey_to_green/screens/planning_event.dart';
import 'package:grey_to_green/screens/home_screen.dart';
import 'package:grey_to_green/screens/map_screen.dart';
import 'package:grey_to_green/screens/profile_screen.dart';
import 'package:grey_to_green/screens/categories_screen.dart';

Future<void> main() async {
  await ApplicationInitiliaze().make();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> screens = [
  const Home(),
  const Categories(),
  const PlanEvent(),
  const Map(),
  const Profile(),
];
int selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color.fromRGBO(26, 28, 24, 1),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Event Details',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          elevation: 0,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}

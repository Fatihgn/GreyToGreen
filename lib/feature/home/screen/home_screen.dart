import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/home/widgets/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool pastEvent = true;
  bool attend = false;

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
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 20,
                        backgroundColor: Color(
                          AppColors.primary,
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
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 30,
                        backgroundColor: Colors.blue,
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
                              backgroundImage: AssetImage('assets/avatar.png'),
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
                                      'FatihSultan Mehmet Kuru',
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
                            const Text(
                              'Change',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Image.network(
                            'https://www.designi.com.br/images/preview/11291452.jpg',
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidthSize / 2.7,
                              child: const Text(
                                'Ipanema Beach',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: screenWidthSize / 2.7,
                                  child: const Text(
                                    textAlign: TextAlign.right,
                                    'Brazil ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: pastEvent
                              ? null
                              : const Text(
                                  'Apr 06,2024 - Apr 13 2024 | 08.00 PM - 10.00 PM',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                        Icon(
                          pastEvent ? Icons.message : Icons.person_2_rounded,
                          color: const Color(
                            AppColors.primary,
                          ),
                          size: 30,
                        ),
                        Text(
                          pastEvent
                              ? 'Çok güzel bir geziydi. Herkese teşekkür ederim. Öptüm.'
                              : '1200 Voluneteers Required',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
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

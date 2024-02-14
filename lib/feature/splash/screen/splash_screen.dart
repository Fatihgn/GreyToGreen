import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/index.dart';

@RoutePage()

/// SplashScreen is the first screen that is shown when the app is launched
class SplashScreen extends StatefulWidget {
  /// constructor for SplashScreen
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Assets.animations.loadingAnim.lottie(package: 'gen'),
        ),
      ),
    );
  }
}

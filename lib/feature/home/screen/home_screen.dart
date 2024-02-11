import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gen/index.dart';

@RoutePage()

/// Home screen
class HomeScreen extends StatelessWidget {
  /// Home screen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(image: Assets.images.applogo.image().image);
  }
}

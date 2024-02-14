import 'package:flutter/material.dart';
import 'package:grey_to_green/product/init/application_initialize.dart';
import 'package:grey_to_green/product/init/theme/custom_dark_theme.dart';
import 'package:grey_to_green/product/init/theme/custom_light_theme.dart';
import 'package:grey_to_green/product/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitiliaze().make();

  runApp(const MyApp());
}

/// MyApp is the root widget of the application
class MyApp extends StatefulWidget {
  /// constructor for MyApp
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final _appRouter = AppRouter();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      routerConfig: _appRouter.config(),
    );
  }
}

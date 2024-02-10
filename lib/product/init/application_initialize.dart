import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable

/// This class initializes the application process
final class ApplicationInitiliaze {
  /// This method initializes the application process
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {},
    );
  }

  /// This method initializes the application process
  Future<void> _initialize() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }
}

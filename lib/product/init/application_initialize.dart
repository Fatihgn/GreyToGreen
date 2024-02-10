import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable

/// This class initializes the application process
final class ApplicationInitiliaze {
  const ApplicationInitiliaze._();

  Future<void> make() async {
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {},
    );
  }

  /// This method initializes the application process
  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }
}

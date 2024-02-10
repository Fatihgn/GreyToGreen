import 'package:flutter/material.dart';
import 'package:grey_to_green/product/init/theme/custom_color_scheme.dart';
import 'package:grey_to_green/product/init/theme/custom_theme.dart';

/// Custom light theme
final class CustomLightTheme implements CustomTheme {
  /// Light theme
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        scaffoldBackgroundColor: scaffoldBackground,
      );

  @override
  final Color scaffoldBackground = const Color.fromRGBO(245, 247, 246, 1);
}

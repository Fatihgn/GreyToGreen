import 'package:flutter/material.dart';
import 'package:gen/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grey_to_green/product/init/theme/custom_color_scheme.dart';
import 'package:grey_to_green/product/init/theme/custom_theme.dart';

/// Custom light theme
final class CustomDarkTheme implements CustomTheme {
  /// Light theme
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        scaffoldBackgroundColor: scaffoldBackground,
      );

  @override
  final Color scaffoldBackground = ColorName.ivory;
  @override
  final TextTheme textTheme = GoogleFonts.poppinsTextTheme();
}

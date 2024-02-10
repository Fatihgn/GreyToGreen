import 'package:flutter/material.dart';

/// Custom color scheme for the app
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF396A1E),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB9F295),
    onPrimaryContainer: Color(0xFF082100),
    secondary: Color(0xFF4D6705),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCEEF83),
    onSecondaryContainer: Color(0xFF151F00),
    tertiary: Color(0xFF386666),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBBEBEB),
    onTertiaryContainer: Color(0xFF002020),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFDF5),
    onBackground: Color(0xFF1A1C18),
    surface: Color(0xFFFDFDF5),
    onSurface: Color(0xFF1A1C18),
    surfaceVariant: Color(0xFFE0E4D6),
    onSurfaceVariant: Color(0xFF43483E),
    outline: Color(0xFF74796D),
    onInverseSurface: Color(0xFFF1F1EA),
    inverseSurface: Color(0xFF2F312C),
    inversePrimary: Color(0xFF9ED67C),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF396A1E),
    outlineVariant: Color(0xFFC4C8BB),
    scrim: Color(0xFF000000),
  );

  /// Dark color scheme
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9ED67C),
    onPrimary: Color(0xFF133800),
    primaryContainer: Color(0xFF225105),
    onPrimaryContainer: Color(0xFFB9F295),
    secondary: Color(0xFFB3D26A),
    onSecondary: Color(0xFF263500),
    secondaryContainer: Color(0xFF394D00),
    onSecondaryContainer: Color(0xFFCEEF83),
    tertiary: Color(0xFFA0CFCF),
    onTertiary: Color(0xFF003737),
    tertiaryContainer: Color(0xFF1E4E4E),
    onTertiaryContainer: Color(0xFFBBEBEB),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C18),
    onBackground: Color(0xFFE3E3DC),
    surface: Color(0xFF1A1C18),
    onSurface: Color(0xFFE3E3DC),
    surfaceVariant: Color(0xFF43483E),
    onSurfaceVariant: Color(0xFFC4C8BB),
    outline: Color(0xFF8D9286),
    onInverseSurface: Color(0xFF1A1C18),
    inverseSurface: Color(0xFFE3E3DC),
    inversePrimary: Color(0xFF396A1E),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF9ED67C),
    outlineVariant: Color(0xFF43483E),
    scrim: Color(0xFF000000),
  );
}
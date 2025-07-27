import 'package:flutter/material.dart';

class ThemeManager {
  static const Color transparentColor = Colors.transparent;
  static const Color primaryColor = Color(0xFF017B80);
  static const Color secondaryColor = Color(0xFF6BA3BE);
  static const Color backgroundColor = Color(0xFF031716);
  static const Color surfaceColor = Color(0xFF032F30);
  static const Color errorColor = Color(0xFF0A7075);
  static const Color borderColor = Color(0xFF274D60);
  static const Color onPrimaryTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color onBackgroundTextColor = Color.fromARGB(255, 255, 255, 255);

  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      primaryColor: primaryColor,
      colorScheme: ColorScheme(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
        onPrimary: onPrimaryTextColor,
        onSecondary: onPrimaryTextColor,
        onSurface: onBackgroundTextColor,
        onError: errorColor,
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryTextColor, // Sets text/icon color
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(color: onBackgroundTextColor),
        bodyLarge: TextStyle(color: onBackgroundTextColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BloomTheme {
  static const Color pastelPink = Color(0xFFFF6E91); // Primary Accent
  static const Color lavender = Color(0xFF7C4DFF); // Secondary Accent
  static const Color mint = Color(0xFF98FF98); // Semantic Success
  static const Color softOrange = Color(0xFFFFB74D); // Semantic Warning
  static const Color softBackground =
      Color(0xFFFCE4EC); // Colors.pink[50] equivalent
  static const Color textColor = Color(0xFF2C3E50);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: pastelPink,
        primary: pastelPink,
        secondary: lavender,
        tertiary: mint,
        background: softBackground,
      ),
      scaffoldBackgroundColor: softBackground,
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        color: Colors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: pastelPink.withOpacity(0.5),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.white,
        indicatorColor: pastelPink.withOpacity(0.5),
        selectedIconTheme: const IconThemeData(color: textColor),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
      ),
    );
  }
}

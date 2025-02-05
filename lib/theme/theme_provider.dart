import 'package:flutter/material.dart';

class ThemeProvider {
  static var accentColor = const Color.fromARGB(255, 255, 197, 98);
  static var darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: accentColor,
      onPrimary: Colors.white,
      surface: Color.fromARGB(255, 18, 18, 18),
      onSurface: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    iconTheme: IconThemeData(color: accentColor),
    cardTheme: CardTheme(
      color: Color.fromARGB(255, 30, 30, 31),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        side: BorderSide(
          color: Color.fromARGB(255, 56, 56, 56),
          width: 1,
        ),
      ),
      shadowColor: Colors.transparent,
    ),
    useMaterial3: true,
  );

  static var lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
      surface: const Color.fromARGB(255, 244, 244, 244),
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      shadowColor: Colors.transparent, // Subtle shadow
    ),
    useMaterial3: true,
  );
}

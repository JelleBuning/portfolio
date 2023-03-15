import 'package:flutter/material.dart';
import 'package:flutter_portfolio/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isLightMode => themeMode == ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  
  // Themes
  ThemeData? darkTheme;
  ThemeData? lightTheme;
  
  ThemeProvider(){
    setThemeMode();
    darkTheme = ThemeData(
      primarySwatch: buildMaterialColor(const Color.fromARGB(0xFF, 0x1F, 0x1E, 0x22)),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );

    lightTheme = ThemeData(
      primarySwatch: buildMaterialColor(Colors.white),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Future<void> setThemeMode() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isDark =  sharedPreferences.getBool(Constants.THEME_KEY);
    isDark = (isDark == null) ? true : isDark;
    themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
  }

  void setTheme(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    sharedPreferences.setBool(Constants.THEME_KEY, isDark);
    notifyListeners();
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }


  
}
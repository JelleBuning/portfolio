import 'package:flutter/material.dart';
import 'package:portfolio/app/home_page.dart';
import 'package:portfolio/theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelle Buning',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeProvider.darkTheme,
      theme: ThemeProvider.lightTheme,
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';

class Responsive {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 640;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 640 &&
        MediaQuery.of(context).size.width <= 1008;
  }
  
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1008;
  }
}
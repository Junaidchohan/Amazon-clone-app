import 'package:flutter/material.dart';

// String uri = 'http://10.8.180.48:3000';
// String uri = 'http://10.0.2.2:3000';
const String uri = 'http://10.8.144.90:3000'; // Physically device
// const String uri = 'http://localhost:3000'; // For Chrome on same PC

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}

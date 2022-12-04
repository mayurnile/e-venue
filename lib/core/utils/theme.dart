import 'package:flutter/material.dart';

class AppTheme {
  // colors
  static const Color primaryColor = Color(0xFF8817FF);
  static const Color primaryLightColor = Color(0xFFB065FF);
  static const Color secondaryColor = Color(0xFF457B9D);
  static const Color unselectedColor = Color(0xFFbab9b8);

  // theme data
  static ThemeData getThemeData() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        indicatorColor: primaryColor,
        fontFamily: "Poppins",
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryLightColor,
          selectionHandleColor: primaryColor,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      );
}

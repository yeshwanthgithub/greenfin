import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00158A),
      brightness: Brightness.light,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 24.0),
      unselectedIconTheme: IconThemeData(size: 24.0),
      selectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}

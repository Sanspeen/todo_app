import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFF1F2937), // Dark blue-gray primary color
  scaffoldBackgroundColor: Color(0xFF1F2937), // Dark blue-gray background color
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6D28D9)), // Purple button background color
    ),
  ),
  appBarTheme: AppBarTheme(
    color: Color(0xFF1F2937), // Dark blue-gray app bar color
  ),
);
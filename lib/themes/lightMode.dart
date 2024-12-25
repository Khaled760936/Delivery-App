import 'package:flutter/material.dart';

ThemeData LightMode = ThemeData(
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.blue.shade900),
  ),
  fontFamily: "Raleway",
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 255, 255, 255),
    primary: Colors.blue.shade700,
    secondary: Colors.blue.shade100,
    tertiary: Colors.white,
    inversePrimary: const Color.fromARGB(255, 0, 0, 0),
  ),
);

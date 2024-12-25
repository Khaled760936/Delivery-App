import 'package:flutter/material.dart';

ThemeData DarkMode = ThemeData(
  fontFamily: "Raleway",
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 33, 33, 33),
    primary: Colors.blue.shade100,
    secondary: Colors.blue.shade300,
    tertiary: Colors.blue.shade800,
    inversePrimary: Colors.grey.shade200,
  ),
);

import 'package:flutter/material.dart';

class MyTheme{
  static get light => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      brightness: Brightness.light
    ),

  );
    static get dark => ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      brightness: Brightness.dark
    ),

  );
}
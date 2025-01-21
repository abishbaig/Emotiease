
import 'package:flutter/material.dart';

class MyAppThemes{
  static ThemeData lightTheme() => ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
  );

  static ThemeData darkTheme() => ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    dividerColor: Colors.black54,
  );
}
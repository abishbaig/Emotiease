import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        dividerColor: Colors.white54,
      );

  static ThemeData darkTheme() => ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.black54,
      );
}

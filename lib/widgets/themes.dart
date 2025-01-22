import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData lightTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        dividerColor: Colors.white54,
      );

  static ThemeData darkTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.black54,
      );
}

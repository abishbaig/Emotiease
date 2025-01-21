import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUi {
  static SystemUiOverlayStyle setSystemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(0, 0, 0, 0.01),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromRGBO(0, 0, 0, 0.01),
      //systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}

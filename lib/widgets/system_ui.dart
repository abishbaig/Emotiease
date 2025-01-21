import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUi {
  static SystemUiOverlayStyle setSystemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}

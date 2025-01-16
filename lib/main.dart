import 'package:emotiease/pages/signin_screen.dart';
import 'package:emotiease/pages/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //! Hiding Top Status Bar and Nav Bar
  WidgetsFlutterBinding
      .ensureInitialized(); //! Ensurement of Flutter Framework Initialization
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: []); //* Customizing System UI
  runApp(const MyApp(
    appTitle: "Emotiease",
  ));
}

class MyApp extends StatelessWidget {
  //* Data Members
  final String appTitle;

  //* Member Functions
  const MyApp({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! Hiding Debug Mode Banner
      debugShowCheckedModeBanner: false,
      //* Setting Material App Content
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: "Poppins",
      ),
      home: const SignInScreen(),
    );
  }
}

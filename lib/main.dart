import 'dart:io';
import 'package:emotiease/pages/chat_screen.dart';
import 'package:emotiease/pages/home_page.dart';
import 'package:emotiease/pages/mood_screen.dart';
import 'package:emotiease/pages/report_screen.dart';
import 'package:emotiease/pages/signin_screen.dart';
import 'package:emotiease/pages/signup_screen.dart';
import 'package:emotiease/pages/starting_screen.dart';
import 'package:emotiease/routes/routes.dart';
import 'package:emotiease/widgets/system_ui.dart';
import 'package:emotiease/widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


void main() async {

  //! Overriding SSl Verification Globally
  HttpOverrides.global = MyHttpOverrides();

  //! Hiding Top Status Bar and Nav Bar
  WidgetsFlutterBinding
      .ensureInitialized(); //! Ensurement of Flutter Framework Initialization
  await Firebase.initializeApp(); //! Firebase Initialization
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //! Setting System UI Overlay Style (Status + Nav Bar)
  SystemChrome.setSystemUIOverlayStyle(SystemUi.setSystemUiOverlayStyle());

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
      //! Setting App Title
      title: appTitle,

      //! Setting Theme
      themeMode: ThemeMode.dark,
      darkTheme: MyAppThemes.darkTheme(),

      //! Setting Routes
      initialRoute: AppRoutes.startingScreen,
      routes: {
        AppRoutes.startingScreen: (context) => const StartingScreen(),
        AppRoutes.signInScreen: (context) => const SignInScreen(),
        AppRoutes.signUpScreen: (context) => const SignUpScreen(),
        AppRoutes.homeScreen: (context) => const HomePage(),
        AppRoutes.chatScreen: (context) => const ChatBot1(),
        AppRoutes.reportScreen: (context) => const ReportAnalysis(),
        AppRoutes.moodScreen: (context) => const MoodAnalysis(),
      },
    );
  }
}

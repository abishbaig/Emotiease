import 'package:emotiease/pages/signin_screen.dart';
import 'package:emotiease/pages/starting_screen.dart';
import 'package:emotiease/routes/routes.dart';
import 'package:emotiease/widgets/system_ui.dart';
import 'package:emotiease/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //! Hiding Top Status Bar and Nav Bar
  WidgetsFlutterBinding
      .ensureInitialized(); //! Ensurement of Flutter Framework Initialization

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
      initialRoute: AppRoutes.signInScreen,
      routes: {
        AppRoutes.startingScreen: (context) => StartingScreen(),
        AppRoutes.signInScreen: (context) => SignInScreen(),
      },
    );
  }
}

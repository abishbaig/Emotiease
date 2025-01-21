import 'package:emotiease/pages/signin_screen.dart';
import 'package:emotiease/routes/routes.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  //* Data Members
  //double _deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  //double _deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  //* Member Functions
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  //* Data Members
  bool gestureTap = false;

  @override
  Widget build(BuildContext context) {
    //final double _deviceHeight = MediaQuery.of(context).size.height;
    //final double _deviceWidth = MediaQuery.of(context).size.width;

    // Scaffold widget provides the basic visual structure for the screen
    return GestureDetector(
      onTap: () async {
        setState(() {
          gestureTap = true;
        });
        // Navigate to the Sign In Screen
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.pushReplacement(
          context,
          //AppRoutes.signInScreen,
          MaterialPageRoute(builder: (context) => SignInScreen(),)
        );
        setState(() {
          gestureTap = false;
        });
      },
      child: Material(
        child: Stack(
          // Stack widget allows layering of different UI elements
          children: [
            _buildTopCircle(), // Adds the top decorative circle
            _buildBottomCircle(), // Adds the bottom decorative circle
            _buildCenteredContent(), // Centers the main content in the middle of the screen
          ],
        ),
      ),
    );
  }

  // Function to build the top decorative circle
  Widget _buildTopCircle() {
    return Positioned(
      // Positioned widget allows us to place the circle at a custom position
      top: -50, // Positioning the circle slightly off the top of the screen
      left: -50, // Positioning the circle slightly off the left of the screen
      child: Image.asset(
        'assets/images/topCircleImage.png',
        fit: BoxFit.fitWidth, // The image asset used for the top circle
        width: gestureTap ? 800 : 200, // Setting width of the circle
        height: 200, // Setting height of the circle to maintain aspect ratio
      ),
    );
  }

  // Function to build the bottom decorative circle
  Widget _buildBottomCircle() {
    return Positioned(
      // Positioned widget to place the bottom circle in a custom position
      bottom: -50, // Moving the circle off the bottom of the screen
      right: -50, // Moving the circle off the right of the screen
      child: Image.asset(
        'assets/images/bottomCircleImage.png', // The image asset for the bottom circle
        fit: BoxFit.fitWidth,
        width: gestureTap ? 800 : 200, // Setting width of the circle
        height: 200, // Setting height of the circle to maintain aspect ratio
      ),
    );
  }

  // Function to build the centered content
  Widget _buildCenteredContent() {
    return Center(
      // Center widget ensures the content is centered both vertically and horizontally
      child: Column(
        // Column widget allows us to stack children vertically
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the column vertically
        children: [
          _buildTitleText(), // The main title text of the app
          Row(
            // Row widget places elements horizontally
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the row horizontally
            children: [
              const SizedBox(
                width: 17,
              ),
              _buildSubtitleText(), // Subtitle text with regular font size
              _buildHighlightedText(), // The highlighted "get started" text in lime green
            ],
          ),
        ],
      ),
    );
  }

  // Function to build the title text
  Widget _buildTitleText() {
    return const Text(
      'Emotiease', // Title of the app
      style: TextStyle(
        color: Colors.white, // White text color for visibility
        fontSize: 40, // Larger font size to make the title prominent
      ),
    );
  }

  // Function to build the subtitle text
  Widget _buildSubtitleText() {
    return const Text(
      'Tap on the screen to ', // Instructional text leading to the action
      style: TextStyle(
        color: Colors.white, // White text for clarity
        fontSize: 13, // Smaller font size for subtitle
      ),
    );
  }

  // Function to build the highlighted text
  Widget _buildHighlightedText() {
    return const Text(
      'get started.', // Action-oriented text in the subtitle
      style: TextStyle(
        color: Color(0xFFB7E22F), // Lime green color for emphasis
        fontSize: 13, // Same font size as subtitle for consistency
      ),
    );
  }
}

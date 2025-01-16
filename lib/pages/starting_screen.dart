import 'package:emotiease/pages/signin_screen.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  //* Data Members
  // No data members required for this screen as it's a simple static UI

  //* Member Functions
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold widget provides the basic visual structure for the screen
    return GestureDetector(
      onTap: () {
        // Navigate to the Sign In Screen
        Navigator.of(context).push(_fadeRoute(const SignInScreen()));
      },
      child: Scaffold(
        backgroundColor:
            Colors.black, // Setting the background color of the screen
        body: Stack(
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

// Function to create a custom fade route
  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Fade transition effect
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration:
          const Duration(milliseconds: 3000), // Transition duration
    );
  }

  // Function to build the top decorative circle
  Widget _buildTopCircle() {
    return Positioned(
      // Positioned widget allows us to place the circle at a custom position
      top: -50, // Positioning the circle slightly off the top of the screen
      left: -50, // Positioning the circle slightly off the left of the screen
      child: Image.asset(
        'assets/images/topCircleImage.png', // The image asset used for the top circle
        width: 200, // Setting width of the circle
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
        width: 200, // Setting width of the circle
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

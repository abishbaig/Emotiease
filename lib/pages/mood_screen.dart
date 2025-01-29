import 'package:flutter/material.dart';

class MoodAnalysis extends StatelessWidget {
  const MoodAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // Dynamic height
    // final screenWidth = MediaQuery.of(context).size.width; // Dynamic width

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Mood Log",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            _buildMoodImage(),
            SizedBox(height: screenHeight * 0.05),
            _buildMoodText(),
            SizedBox(height: screenHeight * 0.05),
            _buildMoodCapsule(),
            SizedBox(height: screenHeight * 0.05),
            _buildCircleMessage(context),
          ],
        ),
      ),
    );
  }

  // Function to build the mood image
  Widget _buildMoodImage() {
    return Center(
      child: Container(
        height: 270,
        width: 270,
        decoration: BoxDecoration(
          color: const Color(0xFFDE385E), // Square background color
          borderRadius: BorderRadius.circular(70),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            "assets/images/moodIcon.png",
          ),
        ),
      ),
    );
  }

  // Function to build the "You're Feeling" Text
  Widget _buildMoodText() {
    return const Text(
      "You're feeling",
    );
  }

  // Function to build the mood capsule with "Sad"
  Widget _buildMoodCapsule() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(1, 178, 110, 1),
        borderRadius: BorderRadius.circular(30), // Capsule shape
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: const Text(
        "Happy",
      ),
    );
  }

  // Function to build the red circle with a message
  Widget _buildCircleMessage(BuildContext context) {
    return ClipPath(
      clipper: BottomCircleClipper(),
      child: Container(
        color: const Color.fromRGBO(1, 178, 110, 1),
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "Emotiease is here to help",
        ),
      ),
    );
  }
}

class BottomCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height * 0.5); // Half-circle curve
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

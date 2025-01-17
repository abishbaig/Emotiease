import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // For dynamic height
    final screenWidth = MediaQuery.of(context).size.width; // For dynamic width

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // Prevent overflow when the keyboard appears
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05), // Responsive spacing
                _buildTitle(),
                SizedBox(height: screenHeight * 0.05),
                _buildGoogleButton(),
                SizedBox(height: screenHeight * 0.02),
                _buildFacebookButton(),
                SizedBox(height: screenHeight * 0.03),
                _buildOrSeparator(),
                SizedBox(height: screenHeight * 0.03),
                _buildEmailField(),
                SizedBox(height: screenHeight * 0.02),
                _buildPasswordField(),
                SizedBox(height: screenHeight * 0.01),
                _buildForgotPassword(),
                SizedBox(height: screenHeight * 0.04),
                _buildDragInstruction(),
                SizedBox(height: screenHeight * 0.02),
                _buildSignInButton(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the title
  Widget _buildTitle() {
    return const Text(
      'Sign In.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Function to build Google button
  Widget _buildGoogleButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color.fromARGB(100, 217, 217, 217),
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const SizedBox(width: 12),
          Image.asset(
            "assets/images/googleIcon.png",
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
              //surfaceTintColor: WidgetStatePropertyAll(Colors.amberAccent),
              overlayColor:
                  WidgetStatePropertyAll(Color.fromARGB(179, 59, 57, 57)),
            ),
            child: const Text(
              'Continue with Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build Facebook button
  Widget _buildFacebookButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color.fromARGB(100, 217, 217, 217),
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.facebook, color: Colors.white),
          const SizedBox(width: 5),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
              overlayColor:
                  WidgetStatePropertyAll(Color.fromARGB(179, 59, 57, 57)),
            ),
            child: const Text(
              'Continue with Facebook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the "OR" separator
  Widget _buildOrSeparator() {
    return const Text(
      'or',
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

  // Function to build email field
  Widget _buildEmailField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color.fromARGB(100, 217, 217, 217),
          width: 3,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'E-mail',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 123, 118, 118)),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Function to build password field
  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color.fromARGB(100, 217, 217, 217),
          width: 3,
        ),
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 123, 118, 118)),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Function to build "Forgot Password" text
  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle "Forgot Password"
        },
        child: const Text(
          'Forgot password?',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
        ),
      ),
    );
  }

  // Function to build the drag instruction
  Widget _buildDragInstruction() {
    return const Text(
      'Drag on sign-in button to move to the next screen',
      style: TextStyle(color: Colors.grey, fontSize: 10),
    );
  }

  // Function to build sign-in button
  Widget _buildSignInButton(double screenWidth) {
    return Container(
      height: 50,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Colors.pinkAccent, Colors.pink],
          radius: 9,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextButton(
          //style: TextStyle(color: Colors.white, fontSize: 18),
          child: const Text(
            'Sign In.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  // Function to build the footer
  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        GestureDetector(
          onTap: () {
            // Handle "Create Account"
          },
          child: TextButton(
            onPressed: () {
              // Handle "Forgot Password"
            },
            child: const Text(
              'Create a account',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

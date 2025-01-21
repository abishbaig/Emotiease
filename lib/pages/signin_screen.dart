import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // For dynamic height
    final screenWidth = MediaQuery.of(context).size.width; // For dynamic width
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05), // Responsive spacing
                  _signInHeader(),
                  SizedBox(height: screenHeight * 0.05),
                  _formFields(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _forgetPassBtn(screenWidth),

                  //_buildGoogleButton(),
                  //SizedBox(height: screenHeight * 0.02),
                  //_buildFacebookButton(),
                  //SizedBox(height: screenHeight * 0.03),
                  //_buildOrSeparator(),
                  //SizedBox(height: screenHeight * 0.03),
                  //_buildEmailField(),
                  //SizedBox(height: screenHeight * 0.02),
                  //_buildPasswordField(),
                  //SizedBox(height: screenHeight * 0.01),
                  //_buildForgotPassword(),
                  //SizedBox(height: screenHeight * 0.04),
                  //_buildDragInstruction(),
                  //SizedBox(height: screenHeight * 0.02),
                  //_buildSignInButton(screenWidth),
                  //SizedBox(height: screenHeight * 0.03),
                  //_buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the title
  Widget _signInHeader() {
    return const Text(
      'Sign In.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _formFields(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              hintText: "Email",
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(179, 132, 255, 0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email cannot be empty!";
              }
              return null;
            },
          ),
          SizedBox(height: screenWidth * 0.04),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              hintText: "Password",
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(179, 132, 255, 0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be empty!!";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _forgetPassBtn(double screenWidth) {
    return InkWell(
      child: Container(
        color: Colors.transparent,
        width: screenWidth * 0.87,
        child: const Text(
          "Forgot Password?",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  
}

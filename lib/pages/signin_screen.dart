import 'package:emotiease/pages/starting_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

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
                  _formFields(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _forgetPassBtn(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.07),
                  _signInBtn(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.05),
                  _dontAccountBtn(),
                  SizedBox(height: screenHeight * 0.02),
                  _authOptions(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.09),
                  _createAccBtn(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.01),
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

  Widget _formFields(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
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
              hintText: "E-mail",
              hintStyle: const TextStyle(
                fontSize: 13,
              ),
              contentPadding: const EdgeInsets.only(left: 25, top: 30),
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
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
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
                fontSize: 13,
              ),
              contentPadding: const EdgeInsets.only(left: 25, top: 30),
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

  Widget _forgetPassBtn(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.55),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: const Color.fromRGBO(63, 15, 75, 0.498),
          borderRadius: BorderRadius.circular(5),
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          onTap: () {
            // TODOs Handle button tap
            debugPrint("Forgot Password button clicked!");
          },
        ),
      ),
    );
  }

  moveToHome(context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      //TODOs : Have to Setup Screen Navigation for "Home page"
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const StartingScreen()));
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget _signInBtn(double screenWidth, double screenHeight) {
    return Material(
      color: const Color.fromRGBO(179, 132, 255, 1),
      borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
        onTap: () => moveToHome(context),
        child: AnimatedContainer(
          width: changeButton ? screenWidth * 0.15 : screenWidth * 0.6,
          height: screenHeight * 0.065,
          alignment: Alignment.center,
          duration: const Duration(
            seconds: 2,
          ),
          child: changeButton
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : const Text(
                  "Sign In.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _dontAccountBtn() {
    return const Text(
      "Don't have an account?",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  Widget _authOptions(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Material(
            color: const Color.fromRGBO(179, 132, 255, 1),
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              splashColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                //! FaceBook Button
                //TODOs Facebook btn implementation
              },
              child: Container(
                width: screenWidth * 0.14,
                height: screenHeight * 0.065,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/facebookIcon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Material(
            color: const Color.fromRGBO(179, 132, 255, 1),
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              splashColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                //! Google Button
                //TODOs Google btn implementation
              },
              child: Container(
                width: screenWidth * 0.14,
                height: screenHeight * 0.065,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/googleIcon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Material(
            color: const Color.fromRGBO(179, 132, 255, 1),
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              splashColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                //! Twitter Button
                //TODOs Twitter btn implementation
              },
              child: Container(
                width: screenWidth * 0.14,
                height: screenHeight * 0.065,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/twitterIcon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createAccBtn(double screenWidth, double screenHeight) {
    return Material(
      color: const Color.fromRGBO(179, 132, 255, 1),
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        splashColor: Colors.white70,
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          //TODOs Create Account Page and logic
        },
        child: Container(
          width: screenWidth * 0.6,
          height: screenHeight * 0.065,
          alignment: Alignment.center,
          child: const Text(
            "Create account",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

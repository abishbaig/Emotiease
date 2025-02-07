import 'package:emotiease/pages/home_page.dart';
import 'package:emotiease/pages/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  bool _obscureText = true;
  bool _isLoading = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _isLoading = false;
    changeButton = false;
    _obscureText = true;
    super.initState();
  }

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
                  _isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : _formFields(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _createAccBtn(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.09),
                  _orTxt(),
                  SizedBox(height: screenHeight * 0.1),
                  _alrdyAccTxt(),
                  SizedBox(height: screenHeight * 0.07),
                  _signInBtn(screenWidth, screenHeight),
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
      'Sign Up.',
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
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
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
            controller: _usernameController,
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
              hintText: "Username",
              hintStyle: const TextStyle(
                fontSize: 13,
              ),
              contentPadding: const EdgeInsets.only(left: 25, top: 30),
              filled: true,
              fillColor: const Color.fromRGBO(179, 132, 255, 0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Username cannot be empty!";
              }
              return null;
            },
          ),
          SizedBox(height: screenWidth * 0.04),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
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
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white54,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 25, top: 30),
              filled: true,
              fillColor: const Color.fromRGBO(179, 132, 255, 0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be empty!!";
              } else if (value.length < 8) {
                return "Password must be at least 8 characters long!";
              } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                return "At least one special character required!";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  moveToSignInDct(BuildContext context) {
    //TODOs : Have to Setup Screen Navigation for "Home page"
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }

  moveToSignInAuth(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // ignore: unused_local_variable
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        )
            .then((value) async {
          setState(() {
            _isLoading = false;
            changeButton = true;
          });

          FirebaseAuth.instance.currentUser!.updateDisplayName(
            _usernameController.text,
          );

          await Future.delayed(const Duration(seconds: 2));

          //TODOs : Have to Setup Screen Navigation for "Home page"
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          setState(() {
            changeButton = false;
          });
          return null;
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });
        return errorDialog(context, e);
      }
    }
  }

  Future<dynamic> errorDialog(BuildContext context, FirebaseAuthException e) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'An error occurred'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createAccBtn(double screenWidth, double screenHeight) {
    return Material(
      color: const Color.fromRGBO(179, 132, 255, 1),
      borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
        onTap: () => moveToSignInAuth(context),
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

  Widget _alrdyAccTxt() {
    return const Text(
      "Already have an account?",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  Widget _orTxt() {
    return const Text(
      "Or",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _signInBtn(double screenWidth, double screenHeight) {
    return Material(
      color: const Color.fromRGBO(179, 132, 255, 1),
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        splashColor: Colors.white70,
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          //TODOs Create Account Page and logic
          moveToSignInDct(context);
        },
        child: Container(
          width: screenWidth * 0.6,
          height: screenHeight * 0.065,
          alignment: Alignment.center,
          child: const Text(
            "Signin",
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

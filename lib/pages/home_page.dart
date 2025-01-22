import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String userName = "User";

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // For dynamic height
    final screenWidth = MediaQuery.of(context).size.width; // For dynamic width
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.transparent,
          child: Stack(
            children: [
              _appBar(screenWidth, screenHeight),
              _backImg(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.055, horizontal: screenWidth * 0.025),
      color: Colors.red,
      width: screenWidth,
      height: screenHeight * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerButton(
            onPressed: () {
              const Drawer(
                backgroundColor: Color.fromRGBO(10, 10, 10, 1),
              );
            },
          ),
          Text(
            "Hi, $userName",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/userImg.jpg"),
          ),
        ],
      ),
    );
  }

  Widget _backImg(double screenWidth, double screenHeight) {
    return Positioned(
      top: screenHeight * -0.005,
      left: screenWidth * 0.3,
      child: Image.asset(
        "assets/images/backDesign.png",
      ),
    );
  }
}

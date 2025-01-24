import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final String userName = "Abish";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // For dynamic height
    final screenWidth = MediaQuery.of(context).size.width; // For dynamic width
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        width: screenWidth * 0.7,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.transparent,
          child: Stack(
            children: [
              _appBar(screenWidth, screenHeight),
              _welcomeTitle(screenWidth, screenHeight),
              _backImg(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.055, horizontal: screenWidth * 0.025),
        color: Colors.transparent,
        width: screenWidth,
        height: screenHeight * 0.06,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.3),
              child: Text(
                "Hi, $userName",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.22),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/userImg.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backImg(double screenWidth, double screenHeight) {
    return Positioned(
      top: screenHeight * -0.01,
      left: screenWidth * 0.28,
      child: Image.asset(
        "assets/images/backDesign.png",
      ),
    );
  }

  Widget _welcomeTitle(double screenWidth, double screenHeight) {
    return Positioned(
      top: screenHeight * 0.15,
      left: screenWidth * 0.085,
      child: Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.105,
        color: Colors.transparent,
        child: const Column(
          children: [
            Row(
              children: [
                Text(
                  "How are ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "you",
                  style: TextStyle(
                    color: Colors.lime,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "feeling ",
                  style: TextStyle(
                    color: Colors.lime,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "today ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

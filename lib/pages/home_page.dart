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
      drawer: const Drawer(),
      body: SingleChildScrollView(
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
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.32),
              child: Text(
                "Hi, $userName",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.25),
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
      top: screenHeight * -0.005,
      left: screenWidth * 0.3,
      child: Image.asset(
        "assets/images/backDesign.png",
      ),
    );
  }
}

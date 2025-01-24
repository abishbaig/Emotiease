import 'package:flutter/cupertino.dart';
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
              _pageOptions(screenWidth, screenHeight),
              _backImg(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(double screenWidth, double screenHeight) {
    return Positioned(
      top: screenHeight * 0.05,
      left: screenWidth * 0.02,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
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
      top: screenHeight * 0.13,
      left: screenWidth * 0.08,
      child: SizedBox(
        width: screenWidth * 0.8,
        height: screenHeight * 0.105,
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
                    color: Color.fromRGBO(198, 244, 50, 1),
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
                    color: Color.fromRGBO(198, 244, 50, 1),
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

  Widget _pageOptions(double screenWidth, double screenHeight) {
    double containerWidth = screenWidth * 0.85;
    double containerHeight = screenHeight * 0.65;
    return Positioned(
      top: screenHeight * 0.255,
      left: screenWidth * 0.08,
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: _pageOptionCard(
                bgColor: const Color.fromRGBO(198, 244, 50, 1),
                leftIcon: const Icon(
                  Icons.phone_in_talk_outlined,
                  color: Colors.black,
                ),
                rightIcon: const Icon(
                  Icons.call_made_sharp,
                  color: Colors.black,
                ),
                leadingTxt: "Wellness\nCall",
                lastTxt: "Connect with our AI for a\nperonalized check-up.",
                onTap: () {},
                width: containerWidth * 0.481,
                height: containerHeight * 0.4,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: //* Quick Chat Card
                  _pageOptionCard(
                bgColor: const Color.fromRGBO(192, 159, 248, 1),
                leftIcon: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                ),
                rightIcon: const Icon(
                  Icons.call_made_sharp,
                  color: Colors.black,
                ),
                leadingTxt: "Quick Chat",
                lastTxt: "Need to vent? Start a Quick Chat.",
                onTap: () {},
                width: containerWidth * 0.481,
                height: containerHeight * 0.281,
              ),
            ),
            Positioned(
              left: 0,
              top: containerHeight * 0.42,
              child: //* Quick Chat Card
                  _pageOptionCard(
                bgColor: const Color.fromRGBO(254, 196, 221, 1),
                leftIcon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.black,
                ),
                rightIcon: const Icon(
                  Icons.call_made_sharp,
                  color: Colors.black,
                ),
                leadingTxt: "Mood Diary",
                lastTxt:
                    "Capture your emotions daily for\nbetter self-awareness.",
                onTap: () {},
                width: containerWidth * 0.481,
                height: containerHeight * 0.281,
              ),
            ),
            Positioned(
              right: 0,
              top: containerHeight * 0.3,
              child: _pageOptionCard(
                bgColor: const Color.fromRGBO(198, 244, 50, 1),
                leftIcon: const Icon(
                  CupertinoIcons.mic_circle,
                  color: Colors.black,
                ),
                rightIcon: const Icon(
                  Icons.call_made_sharp,
                  color: Colors.black,
                ),
                leadingTxt: "Voice\nAnalysis",
                lastTxt: "Speak to detect stress levels.",
                onTap: () {},
                width: containerWidth * 0.481,
                height: containerHeight * 0.4,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: _pageOptionLongCard(
                bgColor: Colors.white,
                leftIcon: const Icon(
                  CupertinoIcons.doc,
                  color: Colors.black,
                ),
                rightIcon: const Icon(
                  Icons.call_made_sharp,
                  color: Colors.black,
                ),
                leadingTxt: "Report Analysis",
                lastTxt: "Check your recent report.",
                onTap: () {},
                width: containerWidth,
                height: containerHeight * 0.28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageOptionCard(
      {required Color bgColor,
      required Icon leftIcon,
      required Icon rightIcon,
      required String leadingTxt,
      required String lastTxt,
      required VoidCallback onTap,
      required double width,
      required double height}) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white,
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: width * 0.1, top: height * 0.09),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(50)),
                    child: leftIcon,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: width * 0.3, top: height * 0.09),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                    child: rightIcon,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                width: width * 0.76,
                child: Text(
                  leadingTxt,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.13,
              ),
              SizedBox(
                width: width * 0.76,
                child: Text(
                  lastTxt,
                  style: const TextStyle(
                    fontSize: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageOptionLongCard(
      {required Color bgColor,
      required Icon leftIcon,
      required Icon rightIcon,
      required String leadingTxt,
      required String lastTxt,
      required VoidCallback onTap,
      required double width,
      required double height}) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.yellow,
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: width * 0.11, top: height * 0.09),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(50)),
                    child: leftIcon,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: width * 0.53, top: height * 0.09),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                    child: rightIcon,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                color: Colors.transparent,
                width: width,
                alignment: Alignment.center,
                child: Text(
                  leadingTxt,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.13,
              ),
              SizedBox(
                width: width * 0.76,
                child: Text(
                  lastTxt,
                  style: const TextStyle(
                    fontSize: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

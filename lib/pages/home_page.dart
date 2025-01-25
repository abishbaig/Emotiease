import 'package:emotiease/pages/starting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "User";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isEditBtnPress = false;

  @override
  void initState() {
    userName = FirebaseAuth.instance.currentUser!.displayName!;
    isEditBtnPress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // For dynamic height
    final screenWidth = MediaQuery.of(context).size.width; // For dynamic width
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(screenWidth, screenHeight, userName, context),
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
    double appBarHeight = screenHeight * 0.06;
    double appBarWidth = screenWidth * 0.88;
    return Positioned(
      top: screenHeight * 0.06,
      left: screenWidth * 0.055,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: appBarWidth,
          height: appBarHeight,
          child: Stack(
            children: [
              Positioned(
                left: 0,
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
              Positioned(
                left: appBarWidth * 0.3,
                top: appBarHeight * 0.2,
                child: Text(
                  "Hi, $userName",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              const Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.png"),
                  backgroundColor: Colors.white,
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

  Widget showEditProfBox(double screenWidth, double screenHeight) {
    return Positioned(
      top: screenHeight * 0.2,
      left: screenWidth * 0.1,
      child: Container(
        color: Colors.red,
        width: screenWidth / 2,
        height: screenHeight / 2,
      ),
    );
  }

  // Function to build the drawer UI
  Widget _buildDrawer(double screenWidth, double screenHeight, String userName,
      BuildContext context) {
    double drawerWidth = screenWidth * 0.7;
    return Drawer(
      width: drawerWidth,
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Section
            const SizedBox(height: 30),
            SizedBox(
              width: drawerWidth,
              child: Padding(
                padding: EdgeInsets.only(left: drawerWidth * 0.045),
                child: Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                //showEditProfBox(screenWidth, screenHeight);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.pencil,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: drawerWidth * 0.05),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),

            // Menu Items
            _buildMenuItem(() {}, Icons.notifications, "Notifications", 12),
            _buildMenuItem(() {}, Icons.message, "Messages", 1),
            const Divider(color: Colors.grey),
            _buildMenuItem(() {}, Icons.help_outline, "Help"),
            _buildMenuItem(() {}, Icons.settings, "Settings"),
            const Divider(color: Colors.grey),
            _buildMenuItem(() async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartingScreen()));
              });
            }, Icons.logout, "Log Out"),
          ],
        ),
      ),
    );
  }

  // Function to build each menu item
  Widget _buildMenuItem(VoidCallback onTap, IconData icon, String title,
      [int? badge]) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(title, style: const TextStyle(color: Colors.white)),
                ],
              ),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "$badge",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:emotiease/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ChatBot1 extends StatelessWidget {
  const ChatBot1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Emotiease',
                style: TextStyle(
                  color: Color(0xFFC6F432),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RedirectingScreen()),
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFC6F432),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                    weight: sqrt1_2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Tap to start chatting',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 50),
            const Text(
              '©2024 Emotiease. All rights reserved.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class RedirectingScreen extends StatelessWidget {
  const RedirectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9643FF), Color(0xFFB384FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Text(
            'Redirecting ...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showTextField = false;
  bool continueAsUnknown = false;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Adjust UI when keyboard appears
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.homeScreen);
            },
          ),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Center(
                          child: Column(
                            children: [
                              Text(
                                'Welcome to EmotiEase AI Bot',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Let's meet each other",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(), // Try replacing this with SizedBox(height: 20)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Important!
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Do you want to set a name for me?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          showTextField = true;
                                          continueAsUnknown = false;
                                        });
                                      },
                                      child: const Text('YES'),
                                    ),
                                    const SizedBox(width: 12),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Confirmation'),
                                            content: const Text(
                                              'Do you want to continue as an unknown user?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('NO'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    continueAsUnknown = true;
                                                    showTextField = true;
                                                  });
                                                },
                                                child: const Text('YES'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text('NO'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                if (showTextField)
                                  Column(
                                    children: [
                                      TextField(
                                        controller: _messageController,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          hintText: continueAsUnknown
                                              ? 'Continue as unknown user'
                                              : 'Type here or speak',
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.mic),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UnderConstructionScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      ElevatedButton(
                                        onPressed: () {
                                          final botName =
                                              _messageController.text.trim();
                                          if (botName.isNotEmpty) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChattingMe(
                                                        botName: botName),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      "Please enter a name for the bot!")),
                                            );
                                          }
                                        },
                                        child: const Text('Send Message'),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 50, color: Color(0xFFC6F432)),
            SizedBox(height: 20),
            Text(
              'Feature Under Construction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChattingMe extends StatefulWidget {
  final String botName;

  const ChattingMe({super.key, required this.botName});

  @override
  State<ChattingMe> createState() => _ChattingMeState();
}

class _ChattingMeState extends State<ChattingMe> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  String? _sessionId;
  bool _isLoading = false;
  final user = FirebaseAuth.instance.currentUser;
  bool _isResponseGetting = false;
  Duration _typingDuration = Duration.zero;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startChat();
    _messages.add({
      'sender': 'bot',
      'message':
          'Hello! ${user!.displayName}. I am ${widget.botName}. How can I help you today?',
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  Future<void> _startChat() async {
    setState(() => _isLoading = true);
    try {
      var response = await http.post(
        Uri.parse('https://20.84.82.255:8000/start_chat'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 307) {
        String? newUrl = response.headers['location'];
        if (newUrl != null) {
          response = await http.post(
            Uri.parse(newUrl),
            headers: {'Content-Type': 'application/json'},
          );
        }
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _sessionId = data['session_id'];
          _isLoading = false;
        });
      } else {
        throw Exception('Server error ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorDialog('Failed to start chat session: ${e.toString()}');
    }
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty || _sessionId == null) return;

    final message = _messageController.text.trim();
    _messageController.clear();

    setState(() {
      _messages.add({'sender': 'user', 'message': message});
      _isResponseGetting = true;
    });

    _startTypingTimer(); // Start the typing timer

    try {
      var requestBody = json.encode({
        'session_id': _sessionId,
        'message': message,
        'user_name': user!.displayName,
      });

      var response = await http.post(
        Uri.parse('https://20.84.82.255:8000/send_message'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 307) {
        String? newUrl = response.headers['location'];
        if (newUrl != null) {
          response = await http.post(
            Uri.parse(newUrl),
            headers: {'Content-Type': 'application/json'},
            body: requestBody,
          );
        }
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String message = data['response'].replaceAll('</s>', '');
        setState(() {
          _isResponseGetting = false;
          _messages.add({'sender': 'bot', 'message': message});
        });
      } else {
        throw Exception('Server error ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog('Failed to send message: ${e.toString()}');
    } finally {
      _stopTypingTimer(); // Stop the typing timer
    }
  }

  void _startTypingTimer() {
    _typingDuration = Duration.zero;
    _typingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _typingDuration += const Duration(seconds: 1);
      });
    });
  }

  void _stopTypingTimer() {
    _typingTimer?.cancel();
    _typingTimer = null;
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$seconds secs';
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat with ${widget.botName}'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length +
                          (_isResponseGetting
                              ? 1
                              : 0), // Add an extra item for the typing indicator
                      itemBuilder: (context, index) {
                        if (_isResponseGetting && index == _messages.length) {
                          // Show typing indicator and timer
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Wait: ${_formatDuration(_typingDuration)}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${widget.botName} is typing...',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        final isUser = _messages[index]['sender'] == 'user';
                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? const Color(0xFFC6F432)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              _messages[index]['message']!,
                              style: TextStyle(
                                color: isUser
                                    ? const Color.fromARGB(255, 0, 0, 0)
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFC6F432),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

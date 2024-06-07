import 'package:flutter/material.dart';
import 'package:lostfound/premium_subscription_page.dart';
import 'sign_in_page.dart';
import 'lost_found_selection.dart';
import 'lost_page.dart';
import 'found_page.dart';
import 'chat_page.dart';
import 'welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost and Found App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/sign_in': (context) => SignInPage(),
        '/lost_found_selection': (context) => LostFoundSelectionPage(),
        '/lost': (context) => LostPage(),
        '/found': (context) => FoundPage(),
        '/chat': (context) => ChatPage(userName: ''),
        '/premium': (context) => TelegramQRCodeGenerator(), // Add the route for the premium page
      },
    );
  }
}


class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent.shade200, Colors.amber.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to IR!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black26,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  // Animated chat icon
                  Hero(
                    tag: 'chatIcon',
                    child: Icon(
                      Icons.chat_bubble_outline,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Creative button design
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign_in');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

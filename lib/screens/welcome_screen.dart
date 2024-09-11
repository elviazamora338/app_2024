import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          tooltip: 'Back',
          onPressed: () {
             Navigator.push(
              context,MaterialPageRoute(builder: (context) => SplashScreen())
            );
          },
        ), 
        title: const Text("Welcome",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Fredoka",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFD0EDF2),
      ), 
      backgroundColor: const Color(0xFF028090),
      body:const Center(
        // creating a column
        child: Column(
          // making sure it's in the center of screen
          mainAxisAlignment: MainAxisAlignment.center,
          // children of the column
          children: 
          [
            // the text title is login
            Text("Welcome!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
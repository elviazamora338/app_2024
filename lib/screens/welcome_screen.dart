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
      body:Center(
        // creating a column
        child: Column(
          // making sure it's in the center of screen
          mainAxisAlignment: MainAxisAlignment.center,
          // children of the column
          children: 
          [
            // the text title is welcome
            const Text("Welcome!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////            
            // Need to create a function to insert as many buttons depending on how many groups
            // user has in database (This is part of Database Sprint Task)
            // for now create a function to navigate or insert navigate functionality for user to go to
            // Home Screen with dummy button -E
            ElevatedButton(onPressed: () {},
               style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF019C9F),
                minimumSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
               ), 
              child: const Text("Group 1",
                style: TextStyle(
                  color:  Color(0xFFD0EDF2),
                  fontSize: 14,
                  fontFamily: "Martel",
                ),
              ), 
            )
          ],
        ),
      ),
    );
  }
  
}
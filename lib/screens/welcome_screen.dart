import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/menu_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(
            color: Color(0xFFB14D60),
            fontSize: 20,
            fontFamily: "Fredoka",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFF3ACB5),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer using the context from Builder
              },
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFF500F15),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40,
                color: Color(0xFFF3ACB5),
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You have successfully signed up.',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFF3ACB5),
                fontFamily: "Montserrat-Regular",
              ),
            ),
            const SizedBox(height: 40),
            MaterialButton(
              minWidth: 200,
              height: 50,
              onPressed: () {
                // Handle button click
              },
              color: const Color(0xFFF3ACB5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF500F15),
                  fontFamily: "Fredoka",
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer( // Add the const keyword here
        child: MenuScreen(),
      ),
      
    );
  }
}
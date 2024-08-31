import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up",
          style: TextStyle(
              color: Color(0xFFB14D60),
              fontSize: 20,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: const Color(0xFFF3ACB5),
      ), 
      backgroundColor: Color(0xFF500F15),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            // const SizedBox(height: 80),
            Text("Sign Up",
              style: TextStyle(
                color: Color(0xFFFCD7DD),
                fontSize: 20,
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
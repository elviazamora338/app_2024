import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 128, 144),
            fontSize: 20,
            fontFamily: "Fredoka",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFF3ACB5),
      ), 
      backgroundColor: Color.fromARGB(255, 2, 128, 144),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            // const SizedBox(height: 80),
            Text("Login",
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
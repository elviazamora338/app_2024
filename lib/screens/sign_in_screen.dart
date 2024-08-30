import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF500F15),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            // const SizedBox(height: 80),
            const Text("Spell Book",
              style: TextStyle(
                color: Color(0xFFFCD7DD),
                fontSize: 48,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Everyday Planning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Montserrat-Italic",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB14D60),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text
              ('Sign in',
                style: TextStyle(
                  color:  Color(0xFFF3ACB5),
                  fontSize: 14,
                  fontFamily: 'Montserrat-Regular', 
                )
              ),
            ),
             ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF3ACB5),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text
                ('Login',
                  style: TextStyle(
                    color: Color(0xFFB14D60),
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular', 
                  )
                ),
            ),
          ],
        ),
      ),
      
    );
  }
}


import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/login_screen.dart';
import 'package:app_swe2024/screens/sign_up_screen.dart';

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
              onPressed: () {
                navigateTo(SignUpScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF3ACB5),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text
              ('Sign Up',
                style: TextStyle(
                  color:  Color(0xFFB14D60),
                  fontSize: 14,
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.bold, 
                )
              ),
            ),
             ElevatedButton(
              onPressed: () {
                navigateTo(LoginScreen());
              },
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
                    fontWeight: FontWeight.bold,
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
  // will be used to navigate to the next page
  void navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page)
    );
  }
}


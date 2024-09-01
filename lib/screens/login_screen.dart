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
            color: Color(0xFFB14D60),
            fontSize: 20,
            fontFamily: "Fredoka",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFF3ACB5),
      ), 
      backgroundColor: const Color(0xFF500F15),
      // my body
      body:  Center(
        // creating a column
        child: Column(
          // making sure it's in the center of screen
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the left
          // children of the column
          children: 
          [
            // the text title is login
            const Text("Login",
            // this was not working >:( 
              // textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFFFCD7DD),
                fontSize: 20,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),
            // some spacing
            const SizedBox(height: 20),
            // a container for the textfields
            Container(
              width: 350,
              height: 150,
              // some decoration
              decoration: BoxDecoration(
                color: const Color(0xFFF3ACB5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFCD7DD),
                  width: 2,
                ),
                // chaning the color of the shadow
                // boxShadow: const [
                //   BoxShadow(
                //     color: Color(0xFFFCD7DD),
                //     blurRadius: 10,
                //     offset: Offset(0, 5),
                //   ),
                // ],                
              ),
              // the children of the container
              child: const Column(
                children: [
                  // the listtile for the username
                  ListTile(
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your username",
                        hintStyle: TextStyle(
                          color: Color(0xFF500F15),
                          fontSize: 18,
                          fontFamily: "Montserrat-Regular",
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // divider between username and password
                  Divider(
                    color: Color(0xFFFCD7DD),
                    thickness: 2,
                  ),
                  // the listtile for the password
                  ListTile(
                    title: TextField(
                      // hides password
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Color(0xFF500F15),
                          fontSize: 18,
                          fontFamily: "Montserrat-Regular",
                        ),
                        border: InputBorder.none,
                      ),
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
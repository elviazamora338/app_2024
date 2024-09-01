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
          // children of the column
          children: 
          [
            // the text title is login
            const Text("Login",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFFF3ACB5),
                fontSize: 35,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
              ),
            ),
            // some spacing
            const SizedBox(height: 20),
           
              // the children of the container
            Column(
              children: [
                // the listtile for the username
                const ListTile(
                  title: TextField(
                     style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity,
                        color: Colors.white,
                      ),
                      hintText: "Enter your username",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat-Regular",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFFF3ACB5),
                        ),
                      ),
                    ),
                  ),
                ),
              

                // the listtile for the password
                const ListTile(
                  title: TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password,
                        color: Colors.white,
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat-Regular",
                      ),
                      // the border of the textfield
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white, // Border color
                        ),
                      ),
                      // when the textfield is enabled
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white, // Border color when enabled
                        ),
                      ),
                      // when the textfield is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFFF3ACB5), // Border color when focused
                        ),
                      ),
                    ),
                  ),
                ),
                // some spacing
                const SizedBox(
                  height:20,
                ),
                // the login button
                ElevatedButton(
                  onPressed: () {
                    // navigate to the welcome screen
                  },
                  // changing the sttyle of the button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF3ACB5),
                    // minimumSize: const Size(200, 40),
                    minimumSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Login",
                    style: TextStyle(
                      color: Color(0xFF500F15),
                      fontSize: 17,
                      fontFamily: "Fedoka",
                      
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
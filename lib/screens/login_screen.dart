import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  final Authorization authorization = Authorization();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFB14D60),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ), 
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
                ListTile(
                  title: TextField(
                    // adding key for tests
                    key: const Key('usernameField'),
                    controller: _usernameController,
                    style: const TextStyle(
                      // color changes when entering text
                      color: Color(0xFFF3ACB5),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat-Regular",
                      ),
                      prefixIcon: Icon(Icons.perm_identity,
                        color: Colors.white,
                      ),
                      hintText: "Enter Username",
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
                ListTile(
                  title: TextField(
                    // added for testing purposes
                    key: const Key('passwordField'),
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      // color changes when inputting text
                      color: Color(0xFFF3ACB5),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat-Regular",
                      ),
                      prefixIcon: Icon(Icons.password,
                        color: Colors.white,
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat-Regular",
                      ),
                      // the border of the textfield
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // color of the border
                          color: Colors.white, 
                        ),
                      ),
                      // when the textfield is enabled
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // Border color when enabled
                          color: Colors.white, 
                        ),
                      ),
                      // when the textfield is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // Border color when focused
                          color: Color(0xFFF3ACB5), 
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
                  key: const Key('signInButton'),
                  onPressed: () {
                    authorization.signIn(context, _usernameController, _passwordController, null);
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
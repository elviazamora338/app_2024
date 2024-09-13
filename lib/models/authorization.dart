import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/welcome_screen.dart';

class Authorization {
  // list that contains the warnings
  List<String> warnings = [
  "Username is empty",
  "Password is empty",
  "Username and Password is empty",
  "Username not found or incorrect",
  "Password is incorrect",
  "Passwords do not match",
  "Login Successful"
  ];
   // function to validate login credentials are entered and correct
  // will need to change this when confirming from datbase - E
  String validate(String username, String password, String? reEnterPassword) {
    if (username.isEmpty && password.isEmpty) 
    {
      // will return the warning: Username and Password is empty
      return warnings[2];
    } 
    // if the username is empty
    else if (username.isEmpty) {
      return warnings[0];
    } 
    // if the password is empty
    else if (password.isEmpty) {
      return warnings[1];
    }
    else if (username.isEmpty && password.isEmpty) {
      return warnings[2];
    } 
    else if(reEnterPassword != null && password != reEnterPassword)
    {
      return warnings[5];
    }
   // if the username and password is empty
    else {
      return warnings[6];
    }
  }
  // function to login
  void signIn(BuildContext context, TextEditingController _usernameController, TextEditingController _passwordController, TextEditingController? _reEnterPassword)
  {
    String username = _usernameController.text;
    String password = _passwordController.text;
   // Check if reEnterPassword is provided and not null before accessing its text
    String ? reEnterPassword = _reEnterPassword?.text;
    
    // calling the validate function to check input of user
    String result = validate(username, password, reEnterPassword);
    // showing the result in a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
        // for at least 2 seconds
        duration: const Duration(seconds: 2),
      ),
    );
    // if the login is successful then the user will be sent to the welcome screen
    if(result == warnings[6])
    {
      Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen())
      );
    });
    }
  }
}
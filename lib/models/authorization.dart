import 'package:flutter/material.dart' ;

class Authorization {
  // list that contains the warnings
  List<String> warnings = [
  "Username is empty",
  "Password is empty",
  "Username and Password is empty",
  "Username not found or incorrect",
  "Password is incorrect"
  ];
   // function to validate login credentials are entered and correct
  // will need to change this when confirming from datbase - E
  String validate(String username, String password) {
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
    // if the username and password is empty
    else if (username.isEmpty && password.isEmpty) {
      return warnings[2];
    } 
    else {
      return "Login Successful";
    }
  }
  // function to login
  void login(BuildContext context, TextEditingController _usernameController, TextEditingController _passwordController)
  {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // calling the validate function to check input of user
    String result = validate(username, password);
    // showing the result in a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
        // for at least 2 seconds
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
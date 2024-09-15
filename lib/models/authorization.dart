import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/welcome_screen.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// opening the database
Future<Database> initializeDatabase() async {
  // Get the path to the app's documents directory
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'Group.db');

  // Check if the database already exists to avoid overwriting it
  if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
    // Load the asset and write it to the documents directory
    ByteData data = await rootBundle.load('assets/database/Group.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }

  // Open the database
  return openDatabase(path);
}
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

  // this will get the records from the database
  void getRecords() async {
   try {
    // Initialize the database
    Database db = await initializeDatabase();

    // Check if the Users table exists by listing all tables
    List<Map<String, dynamic>> tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
    print("Tables in the database: $tables");

    // Query all records from the Users table
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT Username FROM Users');

    // Check if the table has any data
    if (result.isEmpty) {
      print("No records found in the Users table.");
    } 
    else {
       // Print all records from the Users table
      result.forEach((row) {
        print("Username: ${row['Username']}");
      });
    }
  } 
  catch (e) {
    // Print any errors that occur
    print("Error occurred: $e");
  }
}

   // function to validate login credentials are entered and correct
  // will need to change this when confirming from datbase - E
  String validate(String username, String password, String? reEnterPassword) {
    if (username.isEmpty && password.isEmpty) 
    {
      // will return the warning: Username and Password is empty
      getRecords(); 
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
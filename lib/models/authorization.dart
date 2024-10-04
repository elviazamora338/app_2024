import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/welcome_screen.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_swe2024/models/UserInfo.dart';
import 'package:http/http.dart' as http;

List<UserInfo> info = [];
class Authorization {

  // list that contains the warnings
  List<String> warnings = [
  "Username is empty",
  "Password is empty",
  "Username and/or Password is empty",
  "Username not found/incorrect",
  "Password is incorrect",
  "Passwords do not match",
  "Login Successful"
  ];
  
  // this will grab the user's credientials 
  // Future<void> fetchUser() async {
  //   final response = await http.get(Uri.parse('http://169.254.108.148:3000/'));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> json = jsonDecode(response.body);
  //     info = json.map((item) => UserInfo.fromJson(item)).toList();
  //   } 
  //   else {
  //     throw Exception('Failed to load books');
  //   }
  // }
 
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

 // This will get the records from the database
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
      } else {
        // Print all records from the Users table
        result.forEach((row) {
          print("Username: ${row['Username']}");
        });
      }
    } catch (e) {
      // Print any errors that occur
      print("Error occurred: $e");
    }
  }

  // this gets the image from the Database will later change this or copy for other stuff
  // this function loads from the database the image 
  Future<Uint8List?> getImageFromDatabase(String creator) async {
  try {
    // Initialize the database
    Database db = await initializeDatabase();
    

    // Query the image data from the Tasks table
    List<Map<String, dynamic>> result = await db.query(
      'Tasks',
      columns: ['Photos'],
      where: 'creator = ?',
      whereArgs: [creator],
    );

    // If an image is found, return it as bytes
    if (result.isNotEmpty) 
    {
      return result.first['Photos'] as Uint8List;
    }
  } 
  catch (e) {
    print("Error retrieving image: $e");
  }
  // Return null if no image is found or an error occurs
  return null; 
}


  // Function for uploading an image and adding it to the database
  Future<void> addImageToDatabase(String creator, final image) async {
    try {
      // Image picker
      // var picker = ImagePicker();
      // final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      // If an image is picked
      if (image != null) {
        // Convert image to bytes
        Uint8List imageBytes = await File(image.path).readAsBytes();

        // Initialize the database
        Database db = await initializeDatabase();

        // Insert image into the Tasks table where creator matches
        int updatedCount = await db.update(
          'Tasks',
          {'Photos': imageBytes},  // Inserting the image bytes
          where: 'creator = ?',
          whereArgs: [creator],  // Replace with actual username
        );

        // Checking if the update was successful
        if (updatedCount > 0) {
          print("Image successfully added for creator: $creator");
        } 
        else {
          print("No matching record found for creator: $creator");
        }
      } 
      else {
        print("No image selected.");
      }
    } 
    catch (e) {
      print("Error occurred while adding image: $e");
    }
  }


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
    else if(reEnterPassword != null && password != reEnterPassword)
    {
      return warnings[5];
    }
    // all fields were entered
    return warnings[6];
  }

 void signUp(BuildContext context, TextEditingController _usernameController, TextEditingController _passwordController, TextEditingController? _reEnterPassword)
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
  // function to login
  void signIn(BuildContext context, TextEditingController _usernameController, TextEditingController _passwordController, TextEditingController? _reEnterPassword) async
  {
    String username = _usernameController.text;
    String password = _passwordController.text;
   // Check if reEnterPassword is provided and not null before accessing its text
    String ? reEnterPassword = _reEnterPassword?.text;
    
    // calling the validate function to check input of user
    String result = validate(username, password, reEnterPassword);
    
    // if the login is successful
    if(result == warnings[6])
    {
        // send login request
        try
        {
          final response = await http.post(
            // UNTIL I CAN FIND A SOLUTION PUT YOUR IPCONFIG
          Uri.parse('http://169.254.108.148:3000/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'username': username, 'password': password}),
        );
          print("Response status code: ${response.statusCode}");
          print("Response body: ${response.body}");
          // success
          if(response.statusCode == 200)
          {
            // Successfully logged in
            final data = jsonDecode(response.body);
            print("Login successful for user: ${data['username']}");
            // Navigate to the welcome screen
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen())
                );
              });
          }
         // Handle 401 errors for wrong username or password
          else if (response.statusCode == 401) {
            final errorData = jsonDecode(response.body);
            print("Login failed: ${errorData['message']}");
            result = errorData['message'];
          } 
          else {
            // Handle other server errors (if any)
            final errorData = jsonDecode(response.body);
            print("Login failed: ${errorData['message']}");
            result = errorData;
          }
        }
        catch(error){

          print("Error during login request: $error");
          result = ("Error during login request: $error");
        }
    }
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
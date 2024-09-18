import 'dart:io';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/sign_in_screen.dart';
import 'package:app_swe2024/models/authorization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
Authorization authorization = new Authorization();
// the image 
File? uploaded;
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          tooltip: 'Back',
          onPressed: () {
             Navigator.push(
              context,MaterialPageRoute(builder: (context) => SplashScreen())
            );
          },
        ), 
        title: const Text("Home",
          style: TextStyle(
            color:  Colors.black,
            fontSize: 20,
            fontFamily: "Martel",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            // Display the image if it's available
            uploaded != null
                ? Image.file(
                    uploaded!,
                    height: 200, 
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : const Text("No image selected"), 
            ElevatedButton(
              onPressed: uploadImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text("Upload Image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]
        )
      )
    ); 
  }
  void uploadImage() async
  {
    // wait for image uploaded
    File? image = await authorization.addImage();

    // if the variable image is not null then user uploaded an image
    if(image != null)
    {
      setState(()
      {
        // assign uploaded to image
        uploaded = image;
      });
     
    }
  }
}
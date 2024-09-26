import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:app_swe2024/screens/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Authorization authorization = Authorization();
// the image 
File? uploaded;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0EDF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF028090),
        title: const Text(
          "Home",
          style: TextStyle(
            color: Color(0xFFD0EDF2),
            fontSize: 20,
            fontFamily: "Martel",
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu, color: Color(0xFFD0EDF2)),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer using the context from Builder
              },
            );
          },
        ),
      ),
      drawer: const Drawer(
        child: MenuScreen(),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 75,
            color: const Color(0xFFD0EDF2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('profile.jpg'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'username123',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    child: const Text(
                      "Upload Image",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void uploadImage() async {
    // wait for image uploaded
    File? image = await authorization.addImage();

    // if the variable image is not null then user uploaded an image
    if (image != null) {
      setState(() {
        // assign uploaded to image
        uploaded = image;
      });
    }
  }
}

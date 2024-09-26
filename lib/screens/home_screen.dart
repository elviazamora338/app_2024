import 'dart:io';
import 'dart:typed_data';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Authorization authorization = Authorization();
// the image 
File? uploaded;

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    // When the screen loads, check for an existing image for 'username1'
    checkExistingImage('username1');
  }
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
                    onPressed: (){ pickAndUploadImage('username1'); },
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
  // Check if there is an existing image in the database for the given creator
  Future<void> checkExistingImage(String creator) async {
    Uint8List? existingImage = await authorization.getImageFromDatabase(creator);
    if (existingImage != null) {
      // Convert the image bytes to a File object
      Directory tempDir = await getTemporaryDirectory();
      File file = File('${tempDir.path}/existing_image.png');
      file.writeAsBytesSync(existingImage);

      setState(() {
        uploaded = file; // Display the existing image
      });
    }
  }

 Future<void> pickAndUploadImage(String creator) async {
    // Image picker
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // If the user selected an image
    if (image != null) {
      setState(() {
        // Update the image in the UI
        uploaded = File(image.path);
      });

      // Add the image to the database for the given creator
      await authorization.addImageToDatabase(creator, image);
    } else {
      // Show a message if no image is selected
      print("No image selected.");
    }
  }
}

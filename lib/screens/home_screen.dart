import 'dart:io';
import 'dart:typed_data';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/screens/menu_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Authorization authorization = Authorization();
// the image 
File? uploaded;

//Model for comments
class Comment {
  final String username;
  final String comment;

  Comment({required this.username, required this.comment});
}


class _HomeScreenState extends State<HomeScreen> {

  // To track like state
  bool isLiked = false;
  //Track number of comments
  int commentCount = 0;
  List<Comment> comments = []; // Store comments
  // Controller for comment input
  final TextEditingController _commentController = TextEditingController(); 
  final TextEditingController _descriptionController = TextEditingController();
  String _description = '';

  void initState() {
    super.initState();
    // When the screen loads, check for an existing image for 'username1'
    checkExistingImage('username1');
  }

    // Method to add a comment with username
  void addComment(String username) {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        // Add Comment object
        comments.add(Comment(username: username, comment: _commentController.text));
        _commentController.clear(); // Clear the text field after adding
      });
    }
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu, color: Color(0xFFD0EDF2)),
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Open the drawer using the context from Builder
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('profile.jpg'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'username123',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Aligns widgets to the right
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Display the image if it's available
                  uploaded != null
                      //Displayed the image right under username bar,
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: Image.file(
                            uploaded!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Text("No Image Selection"),

                  // Adds the description
                  _description.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _description,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(),

                  // Show description field if an image is uploaded
                  if (uploaded != null)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'username123',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter description',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF028090),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFD0EDF2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),

                  //upload image button
                  ElevatedButton(
                    onPressed: () {
                      pickAndUploadImage('username1');
                    },
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

                  // Row for heart and comment icons
                  if(uploaded != null)
                    Row(
                      children: [
                        // Heart Icon
                        IconButton(
                          key: const Key('heartButton'),
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                        const SizedBox(width: 5),

                        // Comment Icon and Text
                        const Icon(Icons.comment),
                        const SizedBox(width: 5),
                        Text('${comments.length} comments'),
                      ],
                    ),
                    const SizedBox(width: 10),

                  // Text Field to Add a Comment
                  if(uploaded != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              key: const Key('commentField'),
                              controller: _commentController,
                              decoration: const InputDecoration(
                                hintText: 'Add a comment...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            key: const Key('sendButton'),
                            icon: const Icon(Icons.send),
                            // Replace with actual username
                            onPressed: () => addComment("username123"), 
                          ),
                        ],
                      ),
                    ),

                  // Display Comments List
                  if (uploaded != null)
                    ListView.builder(
                      shrinkWrap: true, // Important to avoid infinite height error
                      physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                          comments[index].username, // Display username
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          title: Text(comments[index].comment),
                        );
                      },
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
    Uint8List? existingImage =
        await authorization.getImageFromDatabase(creator);
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

  //Function to add the description
  Future<void> addsDescription(String creator) async {
    String description = _descriptionController.text;

    if (_description.isNotEmpty) {
      setState(() {
        _description = description;
      });

      //could add to database?? idk how that works.. kinda like line 192
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

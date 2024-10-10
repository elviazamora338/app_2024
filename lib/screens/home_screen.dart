import 'dart:io';
import 'dart:typed_data';
//import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/screens/menu_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
  final TextEditingController _descriptionController = TextEditingController();
  String _description = '';

  bool _isLiked = false;
  bool _isCommenting = false;
  final List<String> _comments = [];

  @override
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
        actions: [
          IconButton(
            tooltip: 'User Profile',
            icon: const Icon(Icons.account_circle_rounded,
                color: Color(0xFFD0EDF2), size: 30.0),
            onPressed: () {
              // Define the action when the user icon is pressed
            },

          ),
        ],
      ),
      drawer: const Drawer(
        child: MenuScreen(),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 75,
              color: const Color(0xFFD0EDF2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
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
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          key: const Key('arrowIcon'),
                          icon: Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                          onPressed: _toggleVisibility,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Visibility(
                visible: _isExpanded,
                child: Column(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Heart Icon with red fill on press
                          IconButton(
                            icon: Icon(
                              _isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: _isLiked ? Colors.red : Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                          ),
                          //const SizedBox(width: 6),

                          // Comment Icon
                          IconButton(
                            icon: const Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              setState(() {
                                _isCommenting = !_isCommenting;
                              });
                            },
                          ),
                          const SizedBox(width: 6),

                          const Icon(Icons.add_circle_outline,
                              color: Colors.black, size: 30.0),
                        ],
                      ),
                    ),

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
                    if (uploaded != null)
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
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
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  addsDescription('username123');
                                },
                              ),
                            ],
                          )),

                    //comment input field that appears when _isCommenting is true
                    if (_isCommenting)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  // Hardcoded username, but ideally, you'd pull this from user data.
                                  'username123',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    // This should be linked to capture the input
                                    controller: _descriptionController,
                                    enabled: true, // Ensure it's enabled
                                    decoration: const InputDecoration(
                                      hintText: 'Add a comment...',
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
                                ),
                                IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () {
                                    //Check if the button press works
                                    print("Send button pressed"); //DOES WORKS
                                    // Trigger the comment addition
                                    addsDescription('username123');
                                  },
                                ),
                              ],
                            ),

                            // Display the comments
                            SizedBox(
                              height: 200, // Define a height for the ListView
                              child: ListView.builder(
                                itemCount: _comments.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'username123',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(_comments[index]),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

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
                  ],
                )),
          ],
        ),
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

    // Check if we are capturing the text input
    //print("User input: $description"); //THIS WROK

    if (description.isNotEmpty) {
      setState(() {
        _description = description;
        _comments.add(description); // Add the new comment to the list
        // Clear the input field after adding the comment
        _descriptionController.clear();
      });

      //could add to database?? idk how that works.. kinda like line 192
      await authorization.addCommentToDatabase(creator, description);

      // Debugging to see if the comment is added
      //print('Comment added: $description');
      print("Current comments list: $_comments");
    } else {
      print("No comment added, input field was empty."); //THIS
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

  bool _isExpanded = false;
  void _toggleVisibility() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}

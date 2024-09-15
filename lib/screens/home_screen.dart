import 'package:app_swe2024/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0EDF2),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Color(0xFFD0EDF2),
            //fontSize: 20,
            fontFamily: "Martel",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF028090),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFD0EDF2)),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer using the context from Builder
              },
            );
          },
        ),
      ),
      drawer: const Drawer(
        // Add the const keyword here
        child: MenuScreen(),
      ),
    );
  }
}

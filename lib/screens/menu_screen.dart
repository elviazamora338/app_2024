import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Adjust the height as needed
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xFFF3ACB5), // Same background color for consistency
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Menu',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle navigation to Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, color: Colors.black),
            title: const Text(
              'Calendar',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle navigation to Calendar
            },
          ),
          ListTile(
            leading: const Icon(Icons.task, color: Colors.black),
            title: const Text(
              'Tasks',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle navigation to Tasks
            },
          ),
          
        ],
      ),
    );
  }
}

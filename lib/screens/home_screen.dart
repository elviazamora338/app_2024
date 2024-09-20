import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 75,
            color: Color(0xFFD0EDF2),
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
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                      'username123',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                    
                  ],
                )
              ],
            )
          )
        ],
      )
    );
  }
}



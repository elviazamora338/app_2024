import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up",
          style: TextStyle(
              color: Color(0xFFB14D60),
              fontSize: 20,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: const Color(0xFFF3ACB5),
      ), 
      backgroundColor: Color(0xFF500F15),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 35,
              color:  Color(0xFFF3ACB5),
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,

            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Form(
              child: Column(
                children: [
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(color:  Color(0xFFF3ACB5)),
                        prefixIcon: Icon(Icons.perm_identity, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      
                      onChanged: (String value) {
                          //stores input of field 'Email'
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter an email' : null;
                      },
                    ),
                  ),
            
                  //add some space between input fields
                  SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color:  Color(0xFFF3ACB5)),
                        prefixIcon: Icon(Icons.password, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      
                      onChanged: (String value) {
                          //stores input of field 'Password'
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter a password' : null;
                      },
                    ),
                  ),
            
                  //add some space between input fields
                  SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Re-Enter Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Re-Enter Password',
                        hintStyle: TextStyle(color:  Color(0xFFF3ACB5)),
                        prefixIcon: Icon(Icons.password, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      
                      onChanged: (String value) {
                          //stores input of field 'Password'
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter a password' : null;
                      },
                    ),
                  ),

                  SizedBox(height: 15.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: 
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF500F15),
                            fontFamily: "Fredoka",
                            

                          ),
                        ),
                        color:Color(0xFFF3ACB5),
                        
                        
                    
                    
                    ),
                  ),
                ],
            
              )
            ,),
          )

        ],

      ),
    );
  }
}
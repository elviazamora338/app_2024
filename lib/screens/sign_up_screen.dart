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
      backgroundColor: const Color(0xFF500F15),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
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
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle (
                          color: Colors.white,
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        hintText: 'Enter Username',
                        hintStyle: const TextStyle (
                          color:  Color(0xFFF3ACB5),
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.perm_identity, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xFFF3ACB5),
                          ),

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
                  const SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle (
                          color: Colors.white,
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle (
                          color:  Color(0xFFF3ACB5),
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.password, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xFFF3ACB5),
                          ),

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
                  const SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Re-Enter Password',
                        labelStyle: const TextStyle (
                          color: Colors.white,
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        hintText: 'Re-Enter Password',
                        hintStyle: const TextStyle (
                          color:  Color(0xFFF3ACB5),
                          fontFamily:"Montserrat-Regular",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.password, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xFFF3ACB5),
                          ),

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

                  const SizedBox(height: 15.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      color:const Color(0xFFF3ACB5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: 
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF500F15),
                            fontFamily: "Fredoka",
                          ),
                        ),
                        
                        
                        
                    
                    
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
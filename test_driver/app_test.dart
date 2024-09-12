import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver?.close();
    }
  });

  group('Happy Paths', () {
  
  /// tests the functionality of the sign in button
    test("should be able choose login option", () async {
    print('Tapping "Login" button');
    await driver?.tap(find.text('Login'));
    await Future.delayed(const Duration(seconds: 1)); // Add

   
    // your code here
  });
    test('should be able to successfully login', () async {

      // entering fake username
      // finding by key
      await driver?.tap(find.byValueKey('usernameField'));
      // entering username
      await driver?.enterText('username');
      // finding by key
      await driver?.tap(find.byValueKey('passwordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key the button
      await driver?.tap(find.byValueKey('signInButton'));
      //should get successful login text
      expect(await driver?.getText(find.text('Login Successful')), 'Login Successful');
     
    });
    test("should see welcome screen if sign up successful", () async {

       //should get successful login text
      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));

    });
    // tests the functionality of the login button
    test("should be able to choose sign up option", () async {
      print('Tapping "Sign Up" button');
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1)); 

    });
    test("should be able to succesfully sign up", () async{

      // entering fake username
      // finding by key
      await driver?.tap(find.byValueKey('usernameField'));
      // entering username
      await driver?.enterText('username');
      // finding by key
      await driver?.tap(find.byValueKey('passwordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key
      await driver?.tap(find.byValueKey('re-enterpasswordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key the button
      await driver?.tap(find.byValueKey('signInButton'));
      //should get successful login text
      expect(await driver?.getText(find.text('Login Successful')), 'Login Successful');
    
    });
  test("should see welcome screen if login successsful", () async {


////////////////////////////////////////////////////////////////////////
///      REMOVE THIS SECTION IN ORDER TO TEST GROUP BUTTON TO HOME SCREEN
      //should get successful login text
      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));
///////////////////////////////////////////////////////////////////////////////
    });
/////////////////////////////////////////////////////////////////////////////////////////////////////
///  Here you will create a test to check if the button works correctly -E
    test("user should be able to choose a group", () async {

      // driver should tap button with the text "Group1"

      // Button should take user to the group's home page and so
      // the driver should find the text "Home"

///////// UNCOMMENT THIS SECTION AFTER CODE IS COMPLETE TO TEST//////////////////////////////////////////////
      // // YOU CAN TEST YOUR TESTS BY OPENING YOUR EMULATOR AND RUNNING THIS COMMAND
      // // IN YOUR VSC TERMINAL flutter drive --target=test_driver/app.dart

      // // Go back to the main screen using the back button on the app bar
      // print('Tapping back icon to return to main screen');
      // await Future.delayed(const Duration(seconds: 1));
      // await driver?.tap(find.byTooltip('Back'));
      // await Future.delayed(const Duration(seconds: 3));
         
      
    },skip:true);

  });

  group('Sad Paths', () {
    test("should get warning if Sign Up fields missing", () async {
      // sign up button
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1)); 

      print('Testing sign up warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('testpassword');

      // Attempt to sign up without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')), 'Username is empty');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign up without entering password
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')), 'Password is empty');

    // Attempt to sign up without matching passwords
      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Passwords do not match')), 'Passwords do not match');
    });
    test('should get warning if Login field missing',() async
    {
//////////////////////////////////////////////////////////////////////////////////////
       // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1)); 
///////////////////////////////////////////////////////////////////////////////////////////
     //Attempting to login without username
     print('Testing login warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // await driver?.tap(find.byValueKey('usernameField'));
      // await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')), 'Username is empty');

      //Attempting to login without password
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')), 'Password is empty');

    });

////////////// WILL NEED TO ADD YOUR CODE HERE FOR VERIFICATION OF DATABASE -E  ///////////////////////////
    test('should not be able to login with wrong password', () async {

    },skip:true);
    
 
    test('Username not found or incorrect', () async {

    }, skip:true);

   });
    //on every page
}
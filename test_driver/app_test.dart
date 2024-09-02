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
      test("should be able to login", () async {
      print('Tapping "Login" button');
      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1)); // Add

      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 1));
      // your code here
    });
    // tests the functionality of the login button
    test("should be able to sign in", () async {
      print('Tapping "Sign Up" button');
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1)); // Add
      // your code here
    });


  });

  // group('Sad Paths', () {
  //   /*
  //     Given I am on the Coffee Device Selection Screen
  //     When I press "Continue"
  //     Then I expect to still be on the Coffee Device Selection Screen
  //   */
  //   test("should not advance from Choose Device Screen without a selection",
  //       () {
  //     //your code here
  //   },skip:true);
  //   //on every page
  // },skip:true);
}
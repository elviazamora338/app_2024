import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/logger.dart';

////////////////LOGGER INFO/////////////////////
///_logger.info('This is an info message');
///_logger.warning('This is a warning message');
///_logger.severe('This is an error message');
////////////////////////////////////////////////

//////////////////////FAKE IMAGE JUST FOR TESTING////////////////////////
Future<File> _createFakeImage() async {
  // Create an empty image (e.g., 100x100 pixels)
  img.Image fakeImage = img.Image(100, 100);

  // Fill it with a solid color (e.g., blue)
  fakeImage = img.fill(fakeImage, img.getColor(0, 0, 255));

  // Convert the image to a byte list (PNG format)
  Uint8List pngBytes = Uint8List.fromList(img.encodePng(fakeImage));

  // Get the temporary directory to store the image
  final tempDir = await getTemporaryDirectory();

  // Create the file and write the image data
  File file = File('${tempDir.path}/fake_image.png');
  return file.writeAsBytes(pngBytes);
}
/////////////////////////////////////////////////////////////////////////

void main() {
  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
    setupLogging(); // Initialize logging
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
      logger.info('Tapping "Login" button');
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
      expect(await driver?.getText(find.text('Login Successful')),
          'Login Successful');
    });
    test("should see welcome screen if sign up successful", () async {
      //should get successful login text
      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // Go back to the main screen using the back button on the app bar
      logger.info('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));
    });
    // tests the functionality of the login button
    test("should be able to choose sign up option", () async {
      logger.info('Tapping "Sign Up" button');
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1));
    });
    test("should be able to succesfully sign up", () async {
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
      expect(await driver?.getText(find.text('Login Successful')),
          'Login Successful');
    });
    test("should see welcome screen if login successsful", () async {
////////////////////////////////////////////////////////////////////////
      ///      REMOVE THIS SECTION IN ORDER TO TEST GROUP BUTTON TO HOME SCREEN
      //should get successful login text
      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // Go back to the main screen using the back button on the app bar
      //print('Tapping back icon to return to main screen');
      //await Future.delayed(const Duration(seconds: 1));
      //await driver?.tap(find.byTooltip('Back'));
      //await Future.delayed(const Duration(seconds: 3));
///////////////////////////////////////////////////////////////////////////////
    });
/////////////////////////////////////////////////////////////////////////////////////////////////////
    ///  Here you will create a test to check if the button works correctly -E
    test("user should be able to choose a group", () async {
      // driver should tap button with the text "Group1"
      await driver?.tap(find.text('Group 1'));
      // Button should take user to the group's home page and so
      // the driver should find the text "Home"
      expect(await driver?.getText(find.text('Home')), 'Home');
    });
    // testing if upload button is present
    test("Uploading images button", () async {
      expect(await driver?.getText(find.text("Upload Image")), "Upload Image");
      /////////////////////////////////////////////////////////////////////////////
      /// Remove later on -E
      // // Go back to the main screen using the back button on the app bar
      logger.info('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));
    }, skip: true);
  });

  group('Sad Paths', () {
    test("should get warning if Sign Up fields missing", () async {
      // sign up button
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1));

      logger.info('Testing sign up warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('testpassword');

      // Attempt to sign up without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')),
          'Username is empty');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign up without entering password
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')),
          'Password is empty');

      // Attempt to sign up without matching passwords
      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Passwords do not match')),
          'Passwords do not match');
    }, skip: true);
    test('should get warning if Login field missing', () async {
//////////////////////////////////////////////////////////////////////////////////////
      // Go back to the main screen using the back button on the app bar
      logger.info('Tapping back icon to return to main screen');
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1));
///////////////////////////////////////////////////////////////////////////////////////////
      //Attempting to login without username
      logger.info('Testing login warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // await driver?.tap(find.byValueKey('usernameField'));
      // await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')),
          'Username is empty');

      //Attempting to login without password
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')),
          'Password is empty');
    }, skip: true);

////////////// WILL NEED TO ADD YOUR CODE HERE FOR VERIFICATION OF DATABASE -E  ///////////////////////////
    test('should not be able to login with wrong password', () async {},
        skip: true);

    test('Username not found or incorrect', () async {}, skip: true);
  });

///////////////////////   HEART AND COMMENTS   ///////////////////////////
  test('User can heart a post', () async {
    // Upload a fake image (this assumes the Upload button exists)
    final uploadButton = find.text('Upload Image');
    await driver!.tap(uploadButton);

    // Since Flutter Driver does not directly allow file picking, you'll need to
    // simulate an image being uploaded or bypass this in the test setup.

    // Find the heart button
    final heartButton = find.byValueKey('heartButton');

    // Tap the heart button
    await driver!.tap(heartButton);

    // Check if the heart button changes to liked state
    final likedHeartButton = find.byValueKey('likedHeartButton');
    expect(await driver!.getText(likedHeartButton), '♥');
  });

  // Test the ability to add a comment
  test('User can add a comment to a post', () async {
    // Find the comment text field
    final commentField = find.byValueKey('commentField');

    // Enter a comment
    await driver!.tap(commentField);
    await driver!.enterText('This is a test comment');

    // Tap the send button to post the comment
    final sendButton = find.byValueKey('sendButton');
    await driver!.tap(sendButton);

    // Verify the comment was added by checking if it appears in the comment list
    final commentInList = find.text('This is a test comment');
    expect(await driver!.getText(commentInList), 'This is a test comment');
  });
  ///////////////////////////////////////////////////////////////////////////////////
  ///                         IMAGE TEST                           /////////////
  group('Upload Image Test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close(); // No need to check if driver is null
    });

    test('Test image upload', () async {
      // Simulate tapping the image upload button
      await driver.tap(find.byValueKey('upload_image_button'));
      await Future.delayed(const Duration(seconds: 1)); // Simulating delay
      // Since FlutterDriver doesn't support file uploads directly, we assume
      // the app handles the file internally after this action, and we can verify
      // something in the UI like a confirmation message, new image widget, etc.

      // Example: Check if the image upload result appears in the UI
      expect(await driver.getText(find.byValueKey('image_uploaded_text')),
          'Image Uploaded');
    });
  });

////////////////////////////////////////////////////////////////////////////////

  group(
    'Happy Paths for Menu Tab\n',
    () {
      test("User should be able to open menu tab", () async {
        await driver?.tap(find.byTooltip('Menu'));
        await Future.delayed(const Duration(seconds: 3));
        await driver?.tap(find.text('Home'));
        await Future.delayed(const Duration(seconds: 3));
      });
    },
  ); //on every page
}

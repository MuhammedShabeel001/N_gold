import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Wait for a moment to show splash screen
    await Future.delayed(Duration(seconds: 2));

    // Check if user is logged in
    bool isLoggedIn = await _authController.checkLoggedIn();

    if (isLoggedIn) {
      // Navigate to home screen if logged in
      Get.offAllNamed('/');
    } else {
      // Navigate to login screen if not logged in
      Get.offAllNamed('/logIn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your app logo or splash screen design
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
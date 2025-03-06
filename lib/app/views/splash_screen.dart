import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    await Future.delayed(Duration(seconds: 3));

    bool isLoggedIn = await _authController.checkLoggedIn();

    if (isLoggedIn) {
      Get.offAllNamed('/');
    } else {
      Get.offAllNamed('/logIn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            klogo,
            height: 100,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Lottie.asset(kloading, height: 100),
          ),
        )
      ],
    ));
  }
}

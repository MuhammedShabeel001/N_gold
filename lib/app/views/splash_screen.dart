import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/utils/app_texts.dart';
import 'package:n_gold/app/utils/app_textstyle.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              klogo,
              height: 120,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Text(
                kappName,
                style: ksplashhead,
              ),
            ),
          )
        ],
      ),
    );
  }
}

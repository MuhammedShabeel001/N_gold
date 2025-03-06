import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  final String icon;
  const CustomLoading({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(icon, height: 120),
    );
  }
}

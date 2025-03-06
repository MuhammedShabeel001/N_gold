import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class custom_loading extends StatelessWidget {
  final String icon;
  const custom_loading({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(icon, height: 120),);
  }
}
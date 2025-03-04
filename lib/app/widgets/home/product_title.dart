import 'package:flutter/material.dart';

class ProductsTitleWidget extends StatelessWidget {
  const ProductsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Products',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
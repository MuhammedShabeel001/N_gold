import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final String discountAmount;

  const DiscountWidget({
    super.key,
    required this.discountAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'DISCOUNT  $discountAmount  USD',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

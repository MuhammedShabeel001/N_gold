import 'package:flutter/material.dart';

class HighLowPriceWidget extends StatelessWidget {
  final String highPrice;
  final String lowPrice;

  const HighLowPriceWidget({
    super.key,
    required this.highPrice,
    required this.lowPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF9AEA9A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Highest',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$ $highPrice',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8A7A7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lowest',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$ $lowPrice',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

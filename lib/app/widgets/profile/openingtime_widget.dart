import 'package:flutter/material.dart';

import 'hourrow.dart';

class HoursCardWidget extends StatelessWidget {
  const HoursCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Hours:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amber[700],
            ),
          ),
          const SizedBox(height: 12),
          const HourRowWidget(
              days: 'Monday - Thursday', hours: '10 AM - 10 PM'),
          const SizedBox(height: 8),
          const HourRowWidget(days: 'Friday', hours: '04 PM - 10 PM'),
          const SizedBox(height: 8),
          const HourRowWidget(
              days: 'Saturday - Sunday', hours: '10 PM - 10 PM'),
        ],
      ),
    );
  }
}

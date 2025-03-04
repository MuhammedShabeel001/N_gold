import 'package:flutter/material.dart';

class HourRowWidget extends StatelessWidget {
  final String days;
  final String hours;
  
  const HourRowWidget({
    Key? key,
    required this.days,
    required this.hours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            days,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Text(
          ' : ',
          style: TextStyle(fontSize: 14),
        ),
        Expanded(
          flex: 2,
          child: Text(
            hours,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
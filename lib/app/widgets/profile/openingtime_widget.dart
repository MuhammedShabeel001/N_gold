import 'package:flutter/material.dart';
import 'package:n_gold/app/utils/app_colors.dart';
import 'package:n_gold/app/utils/app_texts.dart';
import 'package:n_gold/app/utils/app_textstyle.dart';

import 'hourrow.dart';

class HoursCardWidget extends StatelessWidget {
  const HoursCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ktextfield,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            openTime,
            style: profileHead
          ),
          const SizedBox(height: 12),
          HourRowWidget(
              days: weekPart1, hours: time1),
          const SizedBox(height: 8),
          HourRowWidget(days: weekPart2, hours: time2),
          const SizedBox(height: 8),
          HourRowWidget(
              days: weekPart3, hours: time1),
        ],
      ),
    );
  }
}

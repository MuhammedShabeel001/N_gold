import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/utils/app_textstyle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(DateTime.now());
    String date = DateFormat('dd MMM yyyy').format(DateTime.now());
 
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(klogo),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(knotification),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: kappbarHead,
          ),
          Text(
            date,
            style: kappbarHead,
          ),
        ],
      ),
    );
  }
}

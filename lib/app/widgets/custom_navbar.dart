import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/utils/app_texts.dart';
import '../controllers/navigation_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();

    return Obx(() => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changePage,
          destinations:  [
            NavigationDestination(icon: SvgPicture.asset(khome), label: page1),
            NavigationDestination(icon: SvgPicture.asset(knews), label: page2), 
            NavigationDestination(icon: SvgPicture.asset(kprofile), label: page3),
          ],
        ));
  }
}

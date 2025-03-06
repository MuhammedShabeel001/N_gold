import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/controllers/navigation_controller.dart';
import 'package:n_gold/app/views/commudities_screen.dart';
import 'package:n_gold/app/views/home_screen.dart';
import 'package:n_gold/app/views/news_screen.dart';
import 'package:n_gold/app/views/profile_screen.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final List<Widget> pages =  [
    HomeScreen(),
    NewsScreen(),
    CommoditiesPage()
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Obx(() => Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomAppBar(),
          ),
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: const CustomNavBar(),
        ));
  }
}
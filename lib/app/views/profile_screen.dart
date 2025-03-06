import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/widgets/custom_loading.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile/contact_info.dart';
import '../widgets/profile/header.dart';
import '../widgets/profile/info_card.dart';
import '../widgets/profile/openingtime_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.find<UserProfileController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return custom_loading(icon: kloading);
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${controller.errorMessage.value}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.fetchUserProfile(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                if (controller.userProfile.value != null)
                  InfoCardWidget(
                    title: 'Location',
                    icon: klocation,
                    subtitle: controller.userProfile.value?.address ?? 'Dubai',
                  ),
                const HoursCardWidget(),
                const ContactInfoRowWidget(),
                const Text(
                  'More',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InfoCardWidget(
                  title: 'Bank Details',
                  icon: kbank,
                ),
                InfoCardWidget(
                  title: 'Live Chart',
                  icon: kchart,
                ),
                InfoCardWidget(
                  title: 'Technical Analysis',
                  icon: kgraph,
                ),
                InfoCardWidget(
                  title: 'Commodities',
                  icon: kcommudities,  
                  onTap: () {
                    Get.toNamed('/commodities');
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

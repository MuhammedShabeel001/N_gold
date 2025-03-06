// import 'package:flutter/material.dart';

// import '../widgets/profile/contact_info.dart';
// import '../widgets/profile/header.dart';
// import '../widgets/profile/info_card.dart';
// import '../widgets/profile/openingtime_widget.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             // spacing: 16,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               const HeaderWidget(),
//               const SizedBox(height: 16),
              
//               // Hours Section
//               const HoursCardWidget(),
//               const SizedBox(height: 16),
              
//               // Contact Info Section
//               const ContactInfoRowWidget(),
//               const SizedBox(height: 16),
              
//               // More Section Header
//               const Text(
//                 'More',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),
              
//               // Additional Info Cards
//               InfoCardWidget(
//                 title: 'Bank Details',
//                 icon: Icons.account_balance,
//               ),
//               const SizedBox(height: 12),
              
//               InfoCardWidget(
//                 title: 'Live Chart',
//                 icon: Icons.insert_chart,
//               ),
//               const SizedBox(height: 12),
              
//               InfoCardWidget(
//                 title: 'Technical Analysis',
//                 icon: Icons.trending_up,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            return const Center(child: CircularProgressIndicator());
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
                  const SizedBox(height: 16),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header - No parameter needed
                const HeaderWidget(),
                const SizedBox(height: 16),
                
                // Location/Address card
                if (controller.userProfile.value != null)
                  InfoCardWidget(
                    title: 'Location',
                    icon: Icons.location_on,
                    subtitle: controller.userProfile.value?.address ?? 'Dubai',
                  ),
                const SizedBox(height: 16),
                
                // Hours Section
                const HoursCardWidget(),
                const SizedBox(height: 16),
                
                // Contact Info Row - No parameter needed
                const ContactInfoRowWidget(),
                const SizedBox(height: 16),
                
                // More Section Header
                const Text(
                  'More',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Additional Info Cards
                InfoCardWidget(
                  title: 'Bank Details',
                  icon: Icons.account_balance,
                ),
                const SizedBox(height: 12),
                
                InfoCardWidget(
                  title: 'Live Chart',
                  icon: Icons.insert_chart,
                ),
                const SizedBox(height: 12),
                
                InfoCardWidget(
                  title: 'Technical Analysis',
                  icon: Icons.trending_up,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
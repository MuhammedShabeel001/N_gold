import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
// import '../controllers/profile_controller.dart';
import '../../controllers/profile_controller.dart';
import 'contact_card.dart';

class ContactInfoRowWidget extends StatelessWidget {
  const ContactInfoRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.find<UserProfileController>();
    
    return Obx(() {
      // Format the phone number if available
      final whatsappNumber = controller.userProfile.value?.whatsapp != null && controller.userProfile.value!.whatsapp != 0
          ? controller.formatPhoneNumber(controller.userProfile.value!.whatsapp)
          : '971581416969';
      
      // Get email if available
      final email = controller.userProfile.value?.email ?? 'Drop us a line';
      
      return Row(
        children: [
          Expanded(
            child: ContactCardWidget(
              title: 'WhatsApp',
              content: whatsappNumber,
              icon: kwhatsapp,
              iconColor: Colors.green,
              // onTap: () {
              //   // Handle WhatsApp tap
              // },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ContactCardWidget(
              title: 'Mail',
              content: email,
              icon: kmail,
              iconColor: Colors.blue,
              // onTap: () {
              //   // Handle email tap
              // },
            ),
          ),
        ],
      );
    });
  }
}
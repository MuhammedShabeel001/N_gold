import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';

import '../../controllers/profile_controller.dart';
import 'contact_card.dart';

class ContactInfoRowWidget extends StatelessWidget {
  const ContactInfoRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.find<UserProfileController>();

    return Obx(() {
      final whatsappNumber = controller.userProfile.value?.whatsapp != null &&
              controller.userProfile.value!.whatsapp != 0
          ? controller.formatPhoneNumber(controller.userProfile.value!.whatsapp)
          : '971581416969';

      final email = controller.userProfile.value?.email ?? 'Drop us a line';

      return Row(
        children: [
          Expanded(
            child: ContactCardWidget(
              title: 'WhatsApp',
              content: whatsappNumber,
              icon: kwhatsapp,
              iconColor: Colors.green,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ContactCardWidget(
              title: 'Mail',
              content: email,
              icon: kmail,
              iconColor: Colors.blue,
            ),
          ),
        ],
      );
    });
  }
}

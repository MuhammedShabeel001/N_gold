import 'package:flutter/material.dart';

import 'contact_card.dart';

class ContactInfoRowWidget extends StatelessWidget {
  const ContactInfoRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ContactCardWidget(
            title: 'WhatsApp',
            content: '971581416969',
            icon: Icons.message_outlined,
            iconColor: Colors.green,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: ContactCardWidget(
            title: 'Mail',
            content: 'Drop us a line',
            icon: Icons.mail_outline,
            iconColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:n_gold/app/models/commudities_model.dart';

class CommodityTile extends StatelessWidget {
  final Commodity commodity;

  const CommodityTile({super.key, required this.commodity});

  @override
  Widget build(BuildContext context) {
    final IconData icon = _getCommodityIcon(commodity.name);
    final Color color = _getCommodityColor(commodity.name);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),
        title: Text(
          commodity.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Tap for latest price details',
          style: TextStyle(fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Get.snackbar(
            'Coming Soon',
            'Detailed ${commodity.name} information will be available soon.',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      ),
    );
  }

  IconData _getCommodityIcon(String name) {
    switch (name.toUpperCase()) {
      case 'GOLD':
        return Icons.monetization_on;
      case 'SILVER':
        return Icons.brightness_medium;
      case 'COPPER':
        return Icons.device_thermostat;
      case 'PLATINUM':
        return Icons.auto_awesome;
      default:
        return Icons.category;
    }
  }

  Color _getCommodityColor(String name) {
    switch (name.toUpperCase()) {
      case 'GOLD':
        return Colors.amber[700]!;
      case 'SILVER':
        return Colors.blueGrey[400]!;
      case 'COPPER':
        return Colors.orange[800]!;
      case 'PLATINUM':
        return Colors.grey[700]!;
      default:
        return Colors.blue;
    }
  }
}

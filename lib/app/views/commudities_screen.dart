// lib/views/commodities_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../controllers/commodities_controller.dart';
import '../controllers/commudities_controller.dart';
// import '../models/commodity_model.dart';
import '../models/commudities_model.dart';

class CommoditiesPage extends StatelessWidget {
  const CommoditiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommoditiesController controller = Get.find<CommoditiesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commodities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshCommodities,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${controller.error.value}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshCommodities,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.commodities.isEmpty) {
          return const Center(child: Text('No commodities available'));
        }

        return RefreshIndicator(
          onRefresh: controller.refreshCommodities,
          child: ListView.builder(
            itemCount: controller.commodities.length,
            itemBuilder: (context, index) {
              final Commodity commodity = controller.commodities[index];
              return CommodityTile(commodity: commodity);
            },
          ),
        );
      }),
    );
  }
}

class CommodityTile extends StatelessWidget {
  final Commodity commodity;

  const CommodityTile({Key? key, required this.commodity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map commodity names to their corresponding icons and colors
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
          // In a real app, this would navigate to a detailed view
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
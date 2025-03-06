// lib/views/commodities_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/widgets/custom_loading.dart';
// import '../controllers/commodities_controller.dart';
import '../controllers/commudities_controller.dart';
// import '../models/commodity_model.dart';
import '../models/commudities_model.dart';
import '../widgets/commudities/commodity_tile.dart';

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
          return custom_loading(icon: kloading);
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


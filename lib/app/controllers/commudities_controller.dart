import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/constants/constants.dart';

import '../models/commudities_model.dart';
import '../serrvices/commudities_services.dart';

class CommoditiesController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxList<Commodity> commodities = <Commodity>[].obs;
  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  final String adminId = ApiConstants.kapiKey;

  @override
  void onInit() {
    super.onInit();
    fetchCommodities();
  }

  Future<void> fetchCommodities() async {
    try {
      isLoading.value = true;
      error.value = '';

      if (kDebugMode) {
        print(
            '[CommoditiesController] Fetching commodities for adminId: $adminId');
      }

      final List<Commodity> result = await _apiService.getCommodities(adminId);

      if (kDebugMode) {
        print('[CommoditiesController] Received ${result.length} commodities');

        if (result.isNotEmpty) {
          print(
              '[CommoditiesController] First commodity: ${result[0].name}, ${result[0].price}');
        }
      }

      commodities.value = result;
    } catch (e) {
      if (kDebugMode) {
        print('[CommoditiesController] Error: $e');
      }
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshCommodities() async {
    await fetchCommodities();
  }
}

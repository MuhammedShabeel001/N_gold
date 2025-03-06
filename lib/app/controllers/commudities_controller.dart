// lib/controllers/commodities_controller.dart

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// import '../models/commodity_model.dart';
import '../models/commudities_model.dart';
import '../serrvices/commudities_services.dart';
// import '../services/api_service.dart';

class CommoditiesController extends GetxController {
  final ApiService _apiService = ApiService();
  
  final RxList<Commodity> commodities = <Commodity>[].obs;
  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  // This would typically come from a user session or config
  final String adminId = '66e994239654078fd531dc2a'; // Example from the Postman collection

  @override
  void onInit() {
    super.onInit();
    fetchCommodities();
  }

// In CommoditiesController
Future<void> fetchCommodities() async {
  try {
    isLoading.value = true;
    error.value = '';
    
    if (kDebugMode) {
      print('[CommoditiesController] Fetching commodities for adminId: $adminId');
    }
    
    final List<Commodity> result = await _apiService.getCommodities(adminId);
    
    if (kDebugMode) {
      print('[CommoditiesController] Received ${result.length} commodities');
      // Print first commodity as sample
      if (result.isNotEmpty) {
        print('[CommoditiesController] First commodity: ${result[0].name}, ${result[0].price}');
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

  // Method to refresh commodities data
  Future<void> refreshCommodities() async {
    await fetchCommodities();
  }
}
// lib/bindings/commodities_binding.dart

import 'package:get/get.dart';
// import '../controllers/commodities_controller.dart';
import '../controllers/commudities_controller.dart';

class CommoditiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommoditiesController>(() => CommoditiesController());
  }
}
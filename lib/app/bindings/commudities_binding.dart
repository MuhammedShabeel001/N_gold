import 'package:get/get.dart';

import '../controllers/commudities_controller.dart';

class CommoditiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommoditiesController>(() => CommoditiesController());
  }
}

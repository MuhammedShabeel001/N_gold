import 'package:get/get.dart';
// Import any global controllers or services you want to initialize

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Add any global dependencies here
    // For example:
    // Get.lazyPut(() => GlobalService());
    // Get.put(SomeController());
  }
}
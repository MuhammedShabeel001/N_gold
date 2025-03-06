// user_profile_binding.dart
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
// import '../controllers/user_profile_controller.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}
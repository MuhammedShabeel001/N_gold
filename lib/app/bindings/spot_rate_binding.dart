import 'package:get/get.dart';
import '../controllers/spot_rate_controller.dart';
import '../serrvices/spotrate_socket_service.dart';

class SpotRateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpotRateWebSocketService>(() => SpotRateWebSocketService(
        baseUrl: 'https://api.task.aurify.ae',
        adminId: '66e994239654078fd531dc2a',
        secretKey: 'IfiuH/Ox6QKC3jP6ES6Y+aGYuGJEAOkbJb'));

    Get.lazyPut<SpotRateController>(() => SpotRateController(
        webSocketService: Get.find<SpotRateWebSocketService>()));
  }
}

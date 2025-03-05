import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:n_gold/app/models/spot_rate_model.dart';
import 'package:n_gold/app/serrvices/spotrate_socket_service.dart';


class SpotRateController extends GetxController {
  final SpotRateWebSocketService webSocketService;
  
  SpotRateController({required this.webSocketService});

  final RxList<SpotRate> _spotRates = <SpotRate>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  List<SpotRate> get spotRates => _spotRates;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    
    // Listen to WebSocket stream
    webSocketService.spotRatesStream.listen(
      (List<SpotRate> rates) {
        _spotRates.value = rates;
        _isLoading.value = false;
        _errorMessage.value = '';
      },
      onError: (error) {
        debugPrint('Spot rates stream error: $error');
        _errorMessage.value = error.toString();
        _isLoading.value = false;
      },
    );

    // Connect to service and fetch initial data
    fetchSpotRates();
  }

  Future<void> fetchSpotRates() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      await webSocketService.fetchInitialSpotRates();
    } catch (e) {
      _errorMessage.value = 'Failed to fetch spot rates';
      debugPrint('Fetch spot rates error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onClose() {
    webSocketService.disconnect();
    super.onClose();
  }
}
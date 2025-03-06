import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:n_gold/app/models/spot_rate_model.dart';
import 'package:n_gold/app/utils/constants/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class SpotRateWebSocketService {
  final String baseUrl;
  final String adminId;
  final String secretKey;
  WebSocketChannel? _channel;
  final StreamController<List<SpotRate>> _spotRatesController =
      StreamController<List<SpotRate>>.broadcast();

  SpotRateWebSocketService({
    required this.baseUrl,
    required this.adminId,
    required this.secretKey,
  });

  Stream<List<SpotRate>> get spotRatesStream => _spotRatesController.stream;

  Future<void> connectWebSocket() async {
    try {
      await fetchInitialSpotRates();

      Timer.periodic(Duration(seconds: 30), (timer) {
        fetchInitialSpotRates();
      });
    } catch (e) {
      debugPrint('WebSocket connection setup error: $e');
    }
  }

  Future<void> fetchInitialSpotRates() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl${ApiConstants.kspotRatesEndpoint}$adminId'),
        headers: {
          'X-Secret-Key': secretKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        debugPrint('Spot Rates Response: $data');

        final spotRates = _parseSpotRates(data);

        if (spotRates.isNotEmpty) {
          _spotRatesController.add(spotRates);
        } else {
          debugPrint('No spot rates found in the response');
        }
      } else {
        debugPrint(
            'Failed to load spot rates. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error fetching spot rates: $e');
    }
  }

  List<SpotRate> _parseSpotRates(dynamic data) {
    try {
      if (data['success'] != true) {
        debugPrint('API response indicates failure');
        return [];
      }

      List<dynamic> commodities = data['info']['commodities'] ?? [];

      return commodities.map((commodity) {
        String symbol = '${commodity['metal']} ${commodity['purity']}';

        double currentPrice = (commodity['sellCharge'] ?? 0).toDouble();

        return SpotRate(
          id: commodity['*id'],
          symbol: symbol,
          currentPrice: currentPrice,
          changePercentage: 0.0,
          lastUpdated: DateTime.now().toIso8601String(),
        );
      }).toList();
    } catch (e) {
      debugPrint('Spot rates parsing error: $e');
      return [];
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _spotRatesController.close();
  }
}

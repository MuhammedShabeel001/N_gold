// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:n_gold/app/models/spot_rate_model.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:http/http.dart' as http;

// class SpotRateWebSocketService {
//   final String baseUrl;
//   final String adminId;
//   final String secretKey;
//   WebSocketChannel? _channel;
//   StreamController<List<SpotRate>> _spotRatesController = StreamController<List<SpotRate>>.broadcast();

//   SpotRateWebSocketService({
//     required this.baseUrl,
//     required this.adminId,
//     required this.secretKey,
//   });

//   Stream<List<SpotRate>> get spotRatesStream => _spotRatesController.stream;

//   Future<void> connectWebSocket() async {
//     try {
//       // Fetch initial spot rates via HTTP
//       await fetchInitialSpotRates();

//       // Fallback to polling if WebSocket is not available
//       Timer.periodic(Duration(seconds: 30), (timer) {
//         fetchInitialSpotRates();
//       });

//       // Commented out WebSocket connection until proper endpoint is provided
//       // final wsUrl = Uri.parse('wss://your-actual-websocket-endpoint.com/spotrates');
//       // _channel = WebSocketChannel.connect(wsUrl);
      
//       // If WebSocket is implemented, uncomment this:
//       // _channel?.stream.listen(
//       //   (message) {
//       //     try {
//       //       final data = json.decode(message);
//       //       final spotRates = _parseSpotRates(data);
//       //       _spotRatesController.add(spotRates);
//       //     } catch (e) {
//       //       debugPrint('WebSocket message parsing error: $e');
//       //     }
//       //   },
//       //   onDone: () => debugPrint('WebSocket connection closed'),
//       //   onError: (error) => debugPrint('WebSocket error: $error'),
//       // );
//     } catch (e) {
//       debugPrint('WebSocket connection setup error: $e');
//     }
//   }

//   Future<void> fetchInitialSpotRates() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/user/get-spotrates/$adminId'),
//         headers: {
//           'X-Secret-Key': secretKey,
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
        
//         // Debugging print to understand the structure
//         debugPrint('Spot Rates Response: $data');

//         final spotRates = _parseSpotRates(data);
        
//         if (spotRates.isNotEmpty) {
//           _spotRatesController.add(spotRates);
//         } else {
//           debugPrint('No spot rates found in the response');
//         }
//       } else {
//         debugPrint('Failed to load spot rates. Status code: ${response.statusCode}');
//         debugPrint('Response body: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Error fetching spot rates: $e');
//     }
//   }

//   List<SpotRate> _parseSpotRates(dynamic data) {
//     try {
//       // Handle different possible JSON structures
//       if (data == null) return [];

//       List<dynamic> ratesList = [];
      
//       // Check different possible keys
//       if (data is Map) {
//         ratesList = data['spotRates'] ?? 
//                     data['rates'] ?? 
//                     data['data'] ?? 
//                     [];
//       } else if (data is List) {
//         ratesList = data;
//       }

//       return ratesList
//           .map((item) => SpotRate.fromJson(item))
//           .toList();
//     } catch (e) {
//       debugPrint('Spot rates parsing error: $e');
//       return [];
//     }
//   }

//   void disconnect() {
//     _channel?.sink.close();
//     _spotRatesController.close();
//   }
// }




import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:n_gold/app/models/spot_rate_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class SpotRateWebSocketService {
  final String baseUrl;
  final String adminId;
  final String secretKey;
  WebSocketChannel? _channel;
  StreamController<List<SpotRate>> _spotRatesController = StreamController<List<SpotRate>>.broadcast();

  SpotRateWebSocketService({
    required this.baseUrl,
    required this.adminId,
    required this.secretKey,
  });

  Stream<List<SpotRate>> get spotRatesStream => _spotRatesController.stream;

  Future<void> connectWebSocket() async {
    try {
      await fetchInitialSpotRates();

      // Fallback to polling if WebSocket is not available
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
        Uri.parse('$baseUrl/user/get-spotrates/$adminId'),
        headers: {
          'X-Secret-Key': secretKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Debugging print to understand the structure
        debugPrint('Spot Rates Response: $data');

        final spotRates = _parseSpotRates(data);
        
        if (spotRates.isNotEmpty) {
          _spotRatesController.add(spotRates);
        } else {
          debugPrint('No spot rates found in the response');
        }
      } else {
        debugPrint('Failed to load spot rates. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error fetching spot rates: $e');
    }
  }

  List<SpotRate> _parseSpotRates(dynamic data) {
    try {
      // Check if the response is successful
      if (data['success'] != true) {
        debugPrint('API response indicates failure');
        return [];
      }

      // Extract commodities list
      List<dynamic> commodities = data['info']['commodities'] ?? [];

      // Parse commodities into SpotRate objects
      return commodities.map((commodity) {
        // Create a unique symbol that includes metal and purity
        String symbol = '${commodity['metal']} ${commodity['purity']}';
        
        // Use sellCharge as the current price (as per the data structure)
        double currentPrice = (commodity['sellCharge'] ?? 0).toDouble();

        return SpotRate(
          id: commodity['*id'],
          symbol: symbol,
          currentPrice: currentPrice,
          changePercentage: 0.0, // No change percentage in this data
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
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:n_gold/app/utils/constants/constants.dart';

import '../models/commudities_model.dart';

class ApiService {
  static const String baseUrl = ApiConstants.kbaseUrl;
  static const String apiKey = ApiConstants.kapiKey;
  static const String endpoint = ApiConstants.kcommoditiesEndpoint;

  Future<List<Commodity>> getCommodities(String adminId) async {
    try {
      final url = '$baseUrl$endpoint$adminId';
      if (kDebugMode) {
        print('[ApiService] Fetching commodities: $url');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-Secret-Key': apiKey,
        },
      );

      if (kDebugMode) {
        print(
            '[ApiService] Commodities response status: ${response.statusCode}');
        print('[ApiService] Commodities response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['success'] == true) {
          final List<dynamic> commoditiesData = data['commodities'] ?? [];

          final commodities = commoditiesData
              .map((item) => Commodity.fromString(item.toString()))
              .toList();

          if (kDebugMode) {
            print('[ApiService] Parsed ${commodities.length} commodities');
          }

          return commodities;
        } else {
          final errorMsg =
              'Failed to fetch commodities: ${data['message'] ?? 'Unknown error'}';
          if (kDebugMode) {
            print('[ApiService] Error: $errorMsg');
          }
          throw Exception(errorMsg);
        }
      } else {
        final errorMsg =
            'Failed to fetch commodities: HTTP ${response.statusCode}';
        if (kDebugMode) {
          print('[ApiService] Error: $errorMsg');
        }
        throw Exception(errorMsg);
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ApiService] Exception: $e');
      }
      throw Exception('Error fetching commodities: $e');
    }
  }
}

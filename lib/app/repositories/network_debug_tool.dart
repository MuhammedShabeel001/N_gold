import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkDebugTool {
  static void logResponse(http.Response response) {
    try {
      log('=== HTTP Response ===');
      log('URL: ${response.request?.url}');
      log('Status Code: ${response.statusCode}');
      log('Headers: ${response.headers}');

      try {
        final dynamic jsonData = json.decode(response.body);
        final prettyJson = const JsonEncoder.withIndent('  ').convert(jsonData);
        log('Body: $prettyJson');
      } catch (e) {
        log('Body: ${response.body}');
        log('(Could not prettify JSON: $e)');
      }

      log('====================');
    } catch (e) {
      log('Error logging response: $e');
    }
  }

  static void logRequest(http.Request request) {
    try {
      log('=== HTTP Request ===');
      log('Method: ${request.method}');
      log('URL: ${request.url}');
      log('Headers: ${request.headers}');
      if (request.method != 'GET') {
        log('Body: ${request.body}');
      }
      log('====================');
    } catch (e) {
      log('Error logging request: $e');
    }
  }
}

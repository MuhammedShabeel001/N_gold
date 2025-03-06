import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/profile_model.dart';

class UserProfileController extends GetxController {
  static UserProfileController get to => Get.find();

  final String baseUrl = 'https://api.task.aurify.ae';
  final String secretKey = 'IfiuH/Ox6QKC3jP6ES6Y+aGYuGJEAOkbJb';

  final Rx<UserProfile?> userProfile = Rx<UserProfile?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final String adminId = '66e994239654078fd531dc2a';

      final response = await http.get(
        Uri.parse('$baseUrl/user/get-profile/$adminId'),
        headers: {
          'X-Secret-Key': secretKey,
          'Content-Type': 'application/json',
        },
      );

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);

        if (jsonResponse is Map<String, dynamic>) {
          final Map<String, dynamic> data = jsonResponse;

          if (data['success'] == true &&
              data['info'] != null &&
              data['info'] is Map<String, dynamic>) {
            userProfile.value = UserProfile.fromJson(data['info']);
            debugPrint(
                'User profile fetched successfully: ${userProfile.value?.companyName}');
          } else {
            errorMessage.value = data['message'] ?? 'Invalid user data format';
            debugPrint('Error in response data: ${errorMessage.value}');
          }
        } else {
          errorMessage.value = 'Invalid response format';
          debugPrint('Invalid response format: $jsonResponse');
        }
      } else {
        errorMessage.value = 'Server error: ${response.statusCode}';
        debugPrint('Server error: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      debugPrint('Exception: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  String formatPhoneNumber(int? phoneNumber) {
    if (phoneNumber == null) return 'N/A';

    final String number = phoneNumber.toString();

    if (number.length >= 12) {
      return '+${number.substring(0, 3)} ${number.substring(3, 9)} ${number.substring(9)}';
    }
    return '+$number';
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  Future<void> loginUser(int contact, String password) async {
    isLoading.value = true;
    final url = Uri.parse(
        'https://api.task.aurify.ae/user/login/66e994239654078fd531dc2a');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'X-Secret-Key': 'IfiuH/Ox6QKC3jP6ES6Y+aGYuGJEAOkbJb'
        },
        body: jsonEncode({"contact": contact, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          user.value = UserModel.fromJson(data['userDetails']);
          Get.snackbar("Success", "Login successful");
          Get.toNamed('/');
        } else {
          Get.snackbar("Error", "Invalid contact number or password.");
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
        log("Status Code: ${response.statusCode}");
        log("Response Body: ${response.body}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword(int contact) async {
    if (contact.toString().isEmpty) {
      Get.snackbar("Error", "Please enter your contact number.");
      return;
    }
    final url = Uri.parse(
        'https://api.task.aurify.ae/user/forgot-password/66e994239654078fd531dc2a');
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-Secret-Key': 'IfiuH/Ox6QKC3jP6ES6Y+aGYuGJEAOkbJb'
        },
        body: jsonEncode({"contact": contact}),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Password reset link sent to your number.");
      } else {
        Get.snackbar("Error", "Failed to send reset link.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}

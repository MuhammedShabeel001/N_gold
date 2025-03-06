import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:n_gold/app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_details';

  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  // Check if user is already logged in
  Future<bool> checkLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    final userJson = prefs.getString(_userKey);

    if (token != null && userJson != null) {
      // Restore user from shared preferences
      user.value = UserModel.fromJson(jsonDecode(userJson));
      return true;
    }
    return false;
  }

  // Save user credentials after successful login
  Future<void> _saveUserCredentials(String token, UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, jsonEncode(userModel.toJson()));
  }

  // Logout method to clear saved credentials
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    user.value = null;
    Get.offAllNamed('/logIn');
  }

  Future<void> loginUser(int contact, String password) async {
    // Validate input
    if (contact.toString().isEmpty || password.isEmpty) {
      Get.snackbar(
        "Validation Error", 
        "Please enter both contact number and password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    }

    isLoading.value = true;
    final url = Uri.parse(
        '${ApiConstants.kbaseUrl}${ApiConstants.kauthEndpoint}${ApiConstants.kdefaultAdminId}');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'X-Secret-Key': ApiConstants.kapiKey
        },
        body: jsonEncode({"contact": contact, "password": password}),
      );

      // More detailed error handling
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          // Save user details
          final userModel = UserModel.fromJson(data['userDetails']);
          user.value = userModel;
          
          // Save token and user details
          await _saveUserCredentials(
            data['token'] ?? '', 
            userModel
          );

          Get.snackbar(
            "Success", 
            "Login successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAllNamed('/');
        } else {
          // More specific error messages
          final errorMessage = data['message'] ?? 'Login failed';
          Get.snackbar(
            "Login Error", 
            errorMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onError,
          );
        }
      } else {
        // Specific error handling based on status code
        String errorMessage;
        switch (response.statusCode) {
          case 401:
            errorMessage = "Unauthorized: Invalid credentials";
            break;
          case 404:
            errorMessage = "User not found";
            break;
          case 500:
            errorMessage = "Server error. Please try again later.";
            break;
          default:
            errorMessage = "An unexpected error occurred: ${response.statusCode}";
        }

        Get.snackbar(
          "Error", 
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );

        // Log detailed error for debugging
        log("Login Error - Status Code: ${response.statusCode}");
        log("Response Body: ${response.body}");
      }
    } catch (e) {
      Get.snackbar(
        "Network Error", 
        "Check your internet connection",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      log("Login Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword(int contact) async {
    // Validate input
    if (contact.toString().isEmpty) {
      Get.snackbar(
        "Validation Error", 
        "Please enter your contact number",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    }

    final url = Uri.parse(
        '${ApiConstants.kbaseUrl}${ApiConstants.kforgotpasswordEndpoint}${ApiConstants.kdefaultAdminId}');
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-Secret-Key': ApiConstants.kapiKey
        },
        body: jsonEncode({"contact": contact}),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success", 
          "Password reset link sent to your number",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error", 
          "Failed to send reset link. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Network Error", 
        "Check your internet connection",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }
}
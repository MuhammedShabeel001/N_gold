import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Contact Number"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => authController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      int? contact = int.tryParse(contactController.text.trim());
                      if (contact == null) {
                        Get.snackbar("Error", "Invalid contact number.");
                        return;
                      }
                      authController.loginUser(contact, passwordController.text.trim());
                    },
                    child: Text("Login"),
                  )),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                int? contact = int.tryParse(contactController.text.trim());
                if (contact == null) {
                  Get.snackbar("Error", "Invalid contact number.");
                  return;
                }
                authController.forgotPassword(contact);
              },
              child: Text("Forgot Password?"),
            ),
          ],
        ),
      ),
    );
  }
}

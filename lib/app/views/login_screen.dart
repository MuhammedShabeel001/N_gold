import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_textfields.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isFormFilled = false.obs;

  LoginScreen() {
    contactController.addListener(_updateFormState);
    passwordController.addListener(_updateFormState);
  }

  void _updateFormState() {
    isFormFilled.value = contactController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Login",
        style: TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: contactController,
                label: "Contact Number",
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              const SizedBox(height: 15),
              Obx(() => CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    obscureText: !isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        isPasswordVisible.toggle();
                      },
                    ),
                  )),
              const SizedBox(height: 25),
              Obx(
                () => ElevatedButton(
                  onPressed: isFormFilled.value
                      ? () {
                          int? contact =
                              int.tryParse(contactController.text.trim());
                          if (contact == null) {
                            Get.snackbar("Error", "Invalid contact number.");
                            return;
                          }
                          authController.loginUser(
                              contact, passwordController.text.trim());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  int? contact = int.tryParse(contactController.text.trim());
                  if (contact == null) {
                    Get.snackbar("Error", "Invalid contact number.");
                    return;
                  }
                  authController.forgotPassword(contact);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

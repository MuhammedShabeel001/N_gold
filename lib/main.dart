import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/bindings/auth_binding.dart';
import 'package:n_gold/app/routes/app_routes.dart';
import 'package:n_gold/app/routes/route_manager.dart';
import 'package:n_gold/app/utils/app_texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: kappName,
        theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.logIn,
        initialBinding: AuthBinding(),
        onGenerateRoute: RouteManager.generateRoute,
      );
  }
}


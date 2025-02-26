import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n_gold/app/routes/app_routes.dart';
import 'package:n_gold/app/views/main_screen.dart';
import 'package:n_gold/app/views/splash_screen.dart';


class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        return CupertinoPageRoute(
          builder: (_) => const MainScreen(),
        );
      case AppRoutes.splashScreen:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
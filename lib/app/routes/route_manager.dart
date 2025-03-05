import 'package:get/get.dart';
import 'package:n_gold/app/bindings/auth_binding.dart';
import 'package:n_gold/app/bindings/spot_rate_binding.dart';
import 'package:n_gold/app/views/login_screen.dart';
import 'package:n_gold/app/views/main_screen.dart';
import 'package:n_gold/app/views/splash_screen.dart';

class AppRoutes {
  // Define route names as static constants
  static const String splashScreen = '/splash';
  static const String logIn = '/login';
  static const String main = '/';

  // GetX pages with associated bindings
  static final pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      binding: AuthBinding()
      // You can add specific bindings if needed
    ),
    GetPage(
      name: logIn,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: main,
      page: () => const MainScreen(),
      bindings: [
        AuthBinding(),
        SpotRateBinding(), // Add your spot rate binding here
      ],
    ),
  ];
}
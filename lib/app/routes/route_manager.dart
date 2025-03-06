import 'package:get/get.dart';
import 'package:n_gold/app/bindings/auth_binding.dart';
import 'package:n_gold/app/bindings/commudities_binding.dart';
import 'package:n_gold/app/bindings/news_binding.dart';
import 'package:n_gold/app/bindings/profile_binding.dart';
import 'package:n_gold/app/bindings/spot_rate_binding.dart';
import 'package:n_gold/app/views/commudities_screen.dart';
import 'package:n_gold/app/views/home_screen.dart';
import 'package:n_gold/app/views/login_screen.dart';
import 'package:n_gold/app/views/main_screen.dart';
import 'package:n_gold/app/views/news_screen.dart';
import 'package:n_gold/app/views/profile_screen.dart';
import 'package:n_gold/app/views/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String logIn = '/login';
  static const String main = '/';
  static const String news = '/news';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String commodities = '/commodities';

  static final pages = [
    GetPage(
        name: splashScreen, page: () => SplashScreen(), binding: AuthBinding()),
    GetPage(
      name: logIn,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: news,
      page: () => NewsScreen(),
      bindings: [AuthBinding(), NewsBinding()],
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      bindings: [AuthBinding(), SpotRateBinding()],
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      bindings: [AuthBinding(), UserProfileBinding()],
    ),
    GetPage(
      name: commodities,
      page: () => CommoditiesPage(),
      bindings: [AuthBinding(), CommoditiesBinding()],
    ),
    GetPage(
      name: main,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        SpotRateBinding(),
        NewsBinding(),
        UserProfileBinding(),
        CommoditiesBinding()
      ],
    ),
  ];
}

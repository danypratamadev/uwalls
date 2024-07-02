import 'package:get/get.dart';
import 'package:uwalls/views/pages/login_page.dart';
import 'package:uwalls/views/pages/splash_page.dart';

class AppRoutes {

  static const rootRoute = '/';
  static const loginRoute = '/login';

  static final routes = [
    GetPage(
      name: rootRoute, 
      page: () => const SplashPage()
    ),
    GetPage(
      name: loginRoute, 
      page: () => const LoginPage()
    ),
  ];

}
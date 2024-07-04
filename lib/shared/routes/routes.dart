import 'package:get/get.dart';
import 'package:uwalls/bindings/explore_binding.dart';
import 'package:uwalls/views/pages/detail_page.dart';
import 'package:uwalls/views/pages/login_page.dart';
import 'package:uwalls/views/pages/main_page.dart';
import 'package:uwalls/views/pages/photoview_page.dart';
import 'package:uwalls/views/pages/splash_page.dart';

class AppRoutes {

  static const rootRoute = '/';
  static const loginRoute = '/login';
  static const mainRoute = '/uwalls';
  static const detailRoute = '/uwalls/detail';
  static const previewRoute = '/uwalls/detail/preview';

  static final routes = [
    GetPage(
      name: rootRoute, 
      page: () => const SplashPage()
    ),
    GetPage(
      name: loginRoute, 
      page: () => const LoginPage()
    ),
    GetPage(
      name: mainRoute, 
      page: () => const MainPage(),
      bindings: [
        ExploreBinding()
      ]
    ),
    GetPage(
      name: detailRoute, 
      page: () => const DetailPage()
    ),
    GetPage(
      name: previewRoute, 
      page: () => const PhotoviewPage()
    ),
  ];

}
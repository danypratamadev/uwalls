import 'package:get/get.dart';
import 'package:uwalls/bindings/auth_binding.dart';
import 'package:uwalls/bindings/firestore_binding.dart';
import 'package:uwalls/bindings/unsplash_binding.dart';
import 'package:uwalls/views/pages/detail_page.dart';
import 'package:uwalls/views/pages/login_page.dart';
import 'package:uwalls/views/pages/main_page.dart';
import 'package:uwalls/views/pages/photoview_page.dart';
import 'package:uwalls/views/pages/register_page.dart';
import 'package:uwalls/views/pages/search_result_page.dart';
import 'package:uwalls/views/pages/splash_page.dart';

class AppRoutes {

  static const rootRoute = '/';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const mainRoute = '/uwalls';
  static const searchRoute = '/uwalls/search';
  static const detailRoute = '/uwalls/detail';
  static const previewRoute = '/uwalls/detail/preview';

  static final routes = [
    GetPage(
      name: rootRoute, 
      page: () => const SplashPage(),
      bindings: [
        AuthBinding(),
        FirestoreBinding(),
      ]
    ),
    GetPage(
      name: loginRoute, 
      page: () => const LoginPage()
    ),
    GetPage(
      name: registerRoute, 
      page: () => const RegisterPage()
    ),
    GetPage(
      name: mainRoute, 
      page: () => const MainPage(),
      binding: UnsplashBinding()
    ),
    GetPage(
      name: searchRoute, 
      page: () => const SearchResultPage()
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
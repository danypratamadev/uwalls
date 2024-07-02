import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UWalls',
      theme: AppTheme.appTheme,
      initialRoute: AppRoutes.rootRoute,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/firebase_options.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.appTheme,
      dark: AppTheme.appTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => GetMaterialApp(
        title: 'UWalls',
        theme: light,
        darkTheme: dark,
        initialRoute: AppRoutes.rootRoute,
        getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

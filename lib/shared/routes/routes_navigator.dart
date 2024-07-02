import 'package:get/get.dart';

class AppNavigator {

  static void push({required String route, Map<String, dynamic>? argument}){
    Get.toNamed(route, arguments: argument);
  }

  static void pushReplacement({required String route, Map<String, dynamic>? argument}){
    Get.offNamed(route, arguments: argument);
  }

  static void pushRemoveAll({required String route, Map<String, dynamic>? argument}){
    Get.offAllNamed(route, arguments: argument);
  }

}
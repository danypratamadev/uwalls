import 'package:get/get.dart';
import 'package:uwalls/controllers/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
  }
}
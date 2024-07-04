import 'package:get/get.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';

class UnsplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UnsplashController(), permanent: true);
  }
}
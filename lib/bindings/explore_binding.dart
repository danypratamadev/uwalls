import 'package:get/get.dart';
import 'package:uwalls/controllers/explore_controller.dart';

class ExploreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ExploreController(), permanent: true);
  }
}
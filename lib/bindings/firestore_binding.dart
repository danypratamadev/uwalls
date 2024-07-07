import 'package:get/get.dart';
import 'package:uwalls/controllers/firestore_controller.dart';

class FirestoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FirestoreController(), permanent: true);
  }
}
import 'package:get/get.dart';

class AppController extends GetxController {

  int currentPage = 1;

  String currentTitle = 'u';

  void onChangePage({required page}) {
    currentPage = page;
    if(page == 0){
      currentTitle = 'search';
    } else if(page == 1) {
      currentTitle = 'u';
    } else if(page == 2) {
      currentTitle = 'saved';
    } else {
      currentTitle = 'my';
    }
    update();
  }

}
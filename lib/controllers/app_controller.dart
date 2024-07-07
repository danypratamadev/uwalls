import 'package:get/get.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class AppController extends GetxController {

  int currentPage = 1;

  String currentTitle = 'explore';

  bool reversePage = false;
  bool fullPreview = false;

  void onChangePage({required page}) {
    if(page == 0){
      currentTitle = 'search';
    } else if(page == 1) {
      currentTitle = 'explore';
    } else if(page == 2) {
      currentTitle = 'collection';
    } else {
      currentTitle = 'my';
    }
    if(page < currentPage) {
      reversePage = true;
    } else {
      reversePage = false;
    }
    currentPage = page;
    update([AppStateId.pageIndex]);
  }

  void onChangePreview({bool? value}) {
    fullPreview = value ?? !fullPreview;
    update([AppStateId.fullPreview]);
  }

}
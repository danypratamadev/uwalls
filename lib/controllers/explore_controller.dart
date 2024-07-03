import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/data/endpoint/api_response.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/data/repository/unsplash_repo_imp.dart';
import 'package:uwalls/models/explore_model.dart';

class ExploreController extends GetxController {

  final unsplashRepo = UnsplashRepoImp();

  int currentPage = 1;

  ApiStatus exploreStatus = ApiStatus.loading;
  List<ExploreModel> listExplore = <ExploreModel>[];

  ScrollController exploreController = ScrollController();
  
  @override
  void onReady() {
    super.onReady();
    fetchExlopre();
  }

  void fetchExlopre() async {
    await unsplashRepo.getExplore(page: currentPage).then((value) => 
      setExploreValue(res: ApiResponse.complete(data: value)))
      .onError((e, stackTrace) => setExploreValue(res: ApiResponse.error(message: e.toString())));
  }

  void setExploreValue({required ApiResponse<List<ExploreModel>> res}) {
    exploreStatus = res.status!;
    if(res.status == ApiStatus.complete) {
      listExplore = res.data!;
    }
    update();
  }

}
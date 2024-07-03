import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/data/endpoint/api_response.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/data/repository/unsplash_repo_imp.dart';
import 'package:uwalls/models/explore_model.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class ExploreController extends GetxController {

  final unsplashRepo = UnsplashRepoImp();

  int currentPage = 1;

  ApiStatus exploreStatus = ApiStatus.loading;
  List<ExploreModel> listExplore = <ExploreModel>[];

  ScrollController exploreController = ScrollController();

  bool setupListen = false;
  bool regetExplore = false;
  bool regetLoading = false;
  
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
      if(regetExplore){
        listExplore.addAll(res.data!);
        listExplore = listExplore.toSet().toList();
        regetExplore = false;
        regetLoading = false;
        update([AppStateId.explore, AppStateId.regetExplore]);
      } else {
        listExplore = res.data!;
        update([AppStateId.explore]);
      }
      if(!setupListen){
        listenController();
      }
    }
  }

  void listenController() {
    setupListen = true;
    exploreController.addListener(() {
      double pixels = exploreController.position.pixels;
      double maxScroll = exploreController.position.maxScrollExtent;
      if(pixels == maxScroll && !regetExplore) {
        currentPage += 1;
        regetExplore = true;
        regetLoading = true;
        Future.delayed(const Duration(milliseconds: 500), () => fetchExlopre());
        update([AppStateId.regetExplore]);
      }
    });
  }

}
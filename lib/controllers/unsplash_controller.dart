import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:uwalls/data/endpoint/api_response.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/data/repository/unsplash_repo_imp.dart';
import 'package:uwalls/models/collection_model.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class UnsplashController extends GetxController {

  final unsplashRepo = UnsplashRepoImp();
  
  @override
  void onReady() {
    super.onReady();
    fetchExplore();
    fetchRecomendation();
    fetchCollection();
  }

  //! EXPLORE PHOTOS
  //? VARIABLE
  int currentPage = 1;

  ApiStatus exploreStatus = ApiStatus.loading;
  List<PhotoModel> listExplore = <PhotoModel>[];

  ScrollController exploreController = ScrollController();

  bool setupListen = false;
  bool regetExplore = false;
  bool regetLoading = false;

  //? METHOD
  void fetchExplore() async {
    await unsplashRepo.getExplore(page: currentPage).then((value) => 
      setExploreValue(res: ApiResponse.complete(data: value)))
      .onError((e, stackTrace) => setExploreValue(res: ApiResponse.error(message: e.toString())));
  }

  void setExploreValue({required ApiResponse<List<PhotoModel>> res}) {
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
        Future.delayed(const Duration(milliseconds: 500), () => fetchExplore());
        update([AppStateId.regetExplore]);
      }
    });
  }

  //! RECOMENDATION PHOTOS
  //? VARIABLE
  ApiStatus recomendationStatus = ApiStatus.loading;
  List<PhotoModel> listRecomendation = <PhotoModel>[];

  //? METHOD
  void fetchRecomendation() async {
    await unsplashRepo.getRecomendation().then((value) => 
      setRecomendationValue(res: ApiResponse.complete(data: value)))
      .onError((e, stackTrace) => setRecomendationValue(res: ApiResponse.error(message: e.toString())));
  }

  void setRecomendationValue({required ApiResponse<List<PhotoModel>> res}) {
    recomendationStatus = res.status!;
    if(res.status == ApiStatus.complete) {
      listRecomendation = res.data!;
      update([AppStateId.recomendation]);
    }
  }

  //! SEARCH PHOTOS
  //? VARIABLE
  int currentSearchPage = 1;
  int totalPhoto = 0;
  int maxSearchPage = 0;

  ApiStatus searchStatus = ApiStatus.loading;
  List<PhotoModel> listSearch = <PhotoModel>[];

  ScrollController searchController = ScrollController();

  String currentSearch = '-';

  bool setupListenSearch = false;
  bool regetSearch = false;
  bool regetLoadingSearch = false;

  //? METHOD
  void requestSearchPhoto({required String query}) {
    currentSearch = query;
    currentSearchPage = 1;
    totalPhoto = 0;
    maxSearchPage = 0;
    searchStatus = ApiStatus.loading;
    listSearch.clear();
    regetSearch = false;
    regetLoadingSearch = false;
    fetchSearch();
  }
  void fetchSearch() async {
    Future.delayed(const Duration(milliseconds: 500), () => 
      AppNavigator.push(route: AppRoutes.searchRoute, argument: {'query': currentSearch}));
    await unsplashRepo.getSearch(
      page: currentSearchPage,
      query: currentSearch,
    ).then((value) => setSearchValue(res: ApiResponse.complete(data: value)))
      .onError((e, stackTrace) => setSearchValue(res: ApiResponse.error(message: e.toString())));
  }

  void setSearchValue({required ApiResponse<Tuple3<List<PhotoModel>, int, int>> res}) {
    searchStatus = res.status!;
    if(res.status == ApiStatus.complete) {
      totalPhoto = res.data!.item2;
      maxSearchPage = res.data!.item3;
      if(regetSearch){
        listSearch.addAll(res.data!.item1);
        listSearch = listSearch.toSet().toList();
        regetSearch = false;
        regetLoadingSearch = false;
        update([AppStateId.search, AppStateId.regetSearch]);
      } else {
        listSearch = res.data!.item1;
        update([AppStateId.search]);
      }
      if(!setupListenSearch){
        listenSearchController();
      }
    }
    update([AppStateId.search]);
  }

  void listenSearchController() {
    setupListenSearch = true;
    searchController.addListener(() {
      double pixels = searchController.position.pixels;
      double maxScroll = searchController.position.maxScrollExtent;
      if(pixels == maxScroll && !regetSearch) {
        int nextPage = currentSearchPage + 1;
        if(nextPage <= maxSearchPage){
          currentSearchPage += 1;
          regetSearch = true;
          regetLoadingSearch = true;
          Future.delayed(const Duration(milliseconds: 500), () => fetchSearch());
          update([AppStateId.regetSearch]);
        }
      }
    });
  }

  //! COLLECTION PHOTOS
  //? VARIABLE
  int currentCollPage = 1;

  ApiStatus collectionStatus = ApiStatus.loading;
  List<CollectionModel> listCollection = <CollectionModel>[];

  ScrollController collectionController = ScrollController();

  bool setupListenColl = false;
  bool regetCollection = false;
  bool regetLoadingColl = false;

  //? METHOD
  void fetchCollection() async {
    await unsplashRepo.getCollection(page: currentCollPage).then((value) => 
      setCollectionValue(res: ApiResponse.complete(data: value)))
      .onError((e, stackTrace) => setCollectionValue(res: ApiResponse.error(message: e.toString())));
  }

  void setCollectionValue({required ApiResponse<List<CollectionModel>> res}) {
    collectionStatus = res.status!;
    if(res.status == ApiStatus.complete) {
      if(regetCollection){
        listCollection.addAll(res.data!);
        listCollection = listCollection.toSet().toList();
        regetCollection = false;
        regetLoadingColl = false;
        update([AppStateId.collection, AppStateId.regetCollection]);
      } else {
        listCollection = res.data!;
        update([AppStateId.collection]);
      }
      if(!setupListenColl){
        listenCollectionController();
      }
    }
  }

  void listenCollectionController() {
    setupListenColl = true;
    collectionController.addListener(() {
      double pixels = collectionController.position.pixels;
      double maxScroll = collectionController.position.maxScrollExtent;
      if(pixels == maxScroll && !regetCollection) {
        currentCollPage += 1;
        regetCollection = true;
        regetLoadingColl = true;
        Future.delayed(const Duration(milliseconds: 500), () => fetchCollection());
        update([AppStateId.regetCollection]);
      }
    });
  }

}
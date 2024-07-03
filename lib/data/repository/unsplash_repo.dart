import 'package:uwalls/models/explore_model.dart';

abstract class UnsplashRepo {
  Future<List<ExploreModel>?> getExplore({required int page});
}
import 'package:tuple/tuple.dart';
import 'package:uwalls/models/collection_model.dart';
import 'package:uwalls/models/photo_model.dart';

abstract class UnsplashRepo {
  Future<List<PhotoModel>?> getExplore({required int page});
  Future<List<PhotoModel>?> getRecomendation();
  Future<Tuple3<List<PhotoModel>, int, int>?> getSearch({required int page, required String query, String? color});
  Future<List<CollectionModel>?> getCollection({required int page});
}
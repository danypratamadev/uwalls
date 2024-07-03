import 'package:uwalls/models/photo_model.dart';

abstract class UnsplashRepo {
  Future<List<PhotoModel>?> getExplore({required int page});
}
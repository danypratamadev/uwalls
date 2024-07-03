import 'package:dio/dio.dart';
import 'package:uwalls/data/endpoint/api_end_points.dart';
import 'package:uwalls/data/repository/unsplash_repo.dart';
import 'package:uwalls/data/services/base_api_service.dart';
import 'package:uwalls/data/services/unsplash_api_service.dart';
import 'package:uwalls/models/photo_model.dart';

class UnsplashRepoImp implements UnsplashRepo {

  Dio dio = Dio();

  final BaseApiService apiService = UnsplashApiService();
  
  @override
  Future<List<PhotoModel>?> getExplore({required int page}) async {
    try {
      dynamic response = await apiService.getResponse(
        url: ApiEndPoints.photos,
        header: {
          'Accept': 'application/json',
        },
        params: {
          'client_id': ApiEndPoints.keyAccess,
          'page': page,
          'per_page': 10,
        }
      );
      List<PhotoModel> result = List<PhotoModel>.from(response.map((data) => 
        PhotoModel.fromJson(json: data)));
      return result;
    } catch (e) {
      rethrow;
    }
  }

}
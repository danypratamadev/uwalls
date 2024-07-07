import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';
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

  @override
  Future<List<PhotoModel>?> getRecomendation() async {
    try {
      dynamic response = await apiService.getResponse(
        url: ApiEndPoints.ramdomPhotos,
        header: {
          'Accept': 'application/json',
        },
        params: {
          'client_id': ApiEndPoints.keyAccess,
          'orientation': 'portrait',
          'count': 10
        }
      );
      log('RECOMENDATION => ${response.toString()}');
      List<PhotoModel> result = List<PhotoModel>.from(response.map((data) => 
        PhotoModel.fromJson(json: data)));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple3<List<PhotoModel>, int, int>?> getSearch({required int page, required String query, String? color}) async {
    try {
      dynamic response = await apiService.getResponse(
        url: ApiEndPoints.searchPhotos,
        header: {
          'Accept': 'application/json',
        },
        params: {
          'client_id': ApiEndPoints.keyAccess,
          'page': page,
          'per_page': 10,
          'order_by': 'relevant',
          'orientation': 'portrait',
          'query': query,
          if(color != null)
          'color': color,
        }
      );
      List<PhotoModel> result = List<PhotoModel>.from(response['results'].map((data) => 
        PhotoModel.fromJson(json: data)));
      int totalPhoto = response['total'] ?? 1;
      int totalPage = response['total_pages'] ?? 1;
      return Tuple3(result, totalPhoto, totalPage);
    } catch (e) {
      rethrow;
    }
  }

}
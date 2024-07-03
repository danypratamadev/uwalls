import 'package:dio/dio.dart';

abstract class BaseApiService {

  final String baseUrl = 'https://api.unsplash.com/';

  final int timeOutRequest = 20;

  Future<dynamic> getResponse({required String url, dynamic params, dynamic header}) async {}
  Future<dynamic> postResponse({required String url, dynamic header, dynamic body}) async {}
  Future<dynamic> deleteResponse({required String url, dynamic header, dynamic body}) async {}
  dynamic returnResponse({required Response res});

}
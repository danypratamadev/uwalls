import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uwalls/data/endpoint/api_exception.dart';
import 'package:uwalls/data/services/base_api_service.dart';

class UnsplashApiService extends BaseApiService {

  Dio dio = Dio();

  @override
  Future getResponse({required String url, params, header}) async {
    dynamic result;
    try {
      final response = await dio.get(baseUrl + url, queryParameters: params, options: Options(headers: header))
        .timeout(Duration(seconds: timeOutRequest));
      result = returnResponse(res: response);
    } on SocketException {
      throw FetchDataException(
        message: 'Perangkat anda tidak terhubung dengan koneksi internet!'
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        message: 'Tidak dapat memproses permintaan anda saat ini, silakan coba kembali.'
      );
    }
    return result;
  }

  @override
  returnResponse({required Response res}) {
    switch(res.statusCode) {
      case 200:
      case 201:
        return res.data;
      case 400:
      case 422:
        throw BadRequestException(message: res.data['errors'] ?? 'Something went wrong!');
      case 401:
      case 403:
      case 404:
        throw UnAuthorizedException(message: res.data['errors'] ?? 'Something went wrong!');
      case 500:
      default:
        throw FetchDataException(
          message: 'Error occurred while connecting with server with status code : ${res.statusCode}',
        );
    }
  }


}
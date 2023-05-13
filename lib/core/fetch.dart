import 'package:dio/dio.dart';

class Fetch {
  late Dio _dio;

  Fetch({required String apiUrl}) {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        baseUrl: apiUrl,
      ),
    );
  }

  Future<dynamic> get({required String route}) async {
    try {
      final response = await _dio.get(route);
      final status = response.statusCode;
      if (status == 204) {
        return null;
      }

      final data = response.data;
      return data;
    } on DioError catch (ex) {
      switch (ex.type) {
        case DioErrorType.connectionTimeout:
          throw FetchTimeoutException();
        case DioErrorType.sendTimeout:
          throw FetchTimeoutException();
        case DioErrorType.receiveTimeout:
          throw FetchTimeoutException();
        case DioErrorType.badCertificate:
          throw FetchUnknownException();
        case DioErrorType.badResponse:
          _badResponse(ex.response);

          throw FetchUnknownException();
        case DioErrorType.cancel:
          throw FetchUnknownException();
        case DioErrorType.connectionError:
          throw FetchUnknownException();
        case DioErrorType.unknown:
          throw FetchUnknownException();
      }
    }
  }

  Future<dynamic> post({
    required String route,
    Object? params,
  }) async {
    try {
      final response = await _dio.post(route, data: params);
      final status = response.statusCode;
      if (status == 204) {
        return null;
      }

      final data = response.data;
      return data;
    } on DioError catch (ex) {
      switch (ex.type) {
        case DioErrorType.connectionTimeout:
          throw FetchTimeoutException();
        case DioErrorType.sendTimeout:
          throw FetchTimeoutException();
        case DioErrorType.receiveTimeout:
          throw FetchTimeoutException();
        case DioErrorType.badCertificate:
          throw FetchUnknownException();
        case DioErrorType.badResponse:
          _badResponse(ex.response);

          throw FetchUnknownException();
        case DioErrorType.cancel:
          throw FetchUnknownException();
        case DioErrorType.connectionError:
          throw FetchUnknownException();
        case DioErrorType.unknown:
          throw FetchUnknownException();
      }
    }
  }

  void _badResponse(Response<dynamic>? response) {
    if (response == null) {
      throw FetchUnknownException();
    }

    switch (response.statusCode) {
      case 404:
        throw FetchNotFoundException();
    }
  }
}

abstract class FetchException implements Exception {}

class FetchTimeoutException extends FetchException {}

class FetchNotFoundException extends FetchException {}

class FetchUnknownException extends FetchException {}

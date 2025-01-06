import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.example.com',
            connectTimeout: const Duration(milliseconds: 5000),
            receiveTimeout: const Duration(milliseconds: 5000),
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return Exception("Connection Timeout");
        case DioExceptionType.sendTimeout:
          return Exception("Send Timeout");
        case DioExceptionType.receiveTimeout:
          return Exception("Receive Timeout");
        case DioExceptionType.badResponse:
          return Exception(
              "Received invalid status: ${error.response?.statusCode}");
        case DioExceptionType.cancel:
          return Exception("Request Cancelled");
        case DioExceptionType.unknown:
          return Exception("Unexpected Error: ${error.message}");
        case DioExceptionType.badCertificate:
          return Exception("Bad Certificate");
        case DioExceptionType.connectionError:
      }
    }
    return Exception("Unexpected Error");
  }
}

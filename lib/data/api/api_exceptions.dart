import 'dart:io';
import 'package:dio/dio.dart';

class ApiException implements Exception {
  late String errorMessage;
  ApiException.fromDioError(DioException dioError) {
    // ignore: avoid_print
    print("message");
    // ignore: avoid_print
    print(dioError.error);
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;

      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          errorMessage = 'No Internet.';
        } else {
          errorMessage = 'Unexpected error occurred.';
        }
        break;
      default:
        errorMessage = 'Something went wrong.';
        break;
    }
  }
  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';

      case 403:
        return 'Unauthorized';

      case 404:
        return 'The requested source does not exist';

      case 405:
        return 'Method not allowed';
      case 415:
        return 'Unsupported media type.';
      case 422:
        return 'Data validation failed';
      case 429:
        return 'Too many requests';
      case 500:
        return 'Internal server error';

      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() {
    return errorMessage;
  }
}

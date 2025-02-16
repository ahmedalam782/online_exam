
import 'package:dio/dio.dart';
import 'package:online_exam/core/network/errors/error_model.dart';
import 'package:online_exam/core/network/network_info.dart';

import 'package:online_exam/domain/common/exceptions/server_error.dart';
import 'package:online_exam/domain/common/result.dart';

Future<Result<T>> executeApi<T>(
    Future<T> Function() apiCall, NetworkInfo networkInfo) async {
  try {
    networkInfo.isConnected;
    try {
      var result = await apiCall.call();
      return Success(result);
    } on DioException catch (ex) {
      switch (ex.type) {
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionTimeout:
          {
            return Error(NetworkError());
          }
        case DioExceptionType.badResponse:
          {
            var responseCode = ex.response?.statusCode ?? 0;
            var errorModel = ErrorModel.fromMap(ex.response?.data);
            if (responseCode >= 400 && responseCode < 500) {
              return Error(ClientError(errorModel));
            }
            if (responseCode >= 500 && responseCode < 600) {
              return Error(ServerError(errorModel));
            }
            return Error(Exception('Something Went Wrong'));
          }
        default:
          {
            return Error(Exception('Something Went Wrong'));
          }
      }
    } on Exception catch (ex) {
      return Error(ex);
    }
  } on NetworkError catch (e) {
    return Error(NetworkError());
  }
}
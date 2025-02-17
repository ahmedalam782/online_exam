import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/api_interceptors.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class DioConsumer {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  DioConsumer(
    this.dio,
    this.sharedPreferences,
  ) {
    dio.interceptors.add(
      ApiInterceptors(
        sharedPreferences,
      ),
    ); // For add token in request header of interceptors
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        error: true,
      ),
    ); // For print logs of interceptors in console
  }
}

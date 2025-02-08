import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
      ));

  @preResolve
  Future<SharedPreferences> get instance => SharedPreferences.getInstance();
}

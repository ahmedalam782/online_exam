import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@singleton
class ApiInterceptors extends Interceptor {
  final SharedPreferences instance;
  const ApiInterceptors(this.instance
      );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   
    super.onRequest(options, handler);
  }
}

import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  // final AuthLocalDataSources _authLocalDataSources;
  const ApiInterceptors(
      // this._authLocalDataSources,
      );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // String? token = _authLocalDataSources.getAccessToken();
    // options.headers[ApiKey.authorization] = 'Bearer ${token ?? ''}';
    super.onRequest(options, handler);
  }
}

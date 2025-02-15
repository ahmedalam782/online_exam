import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:online_exam/data/data_sources/auth/local/auth_local_data_sources.dart';

@Singleton(as: Interceptor)
class ApiInterceptors extends Interceptor {
  final AuthLocalDataSources _authLocalDataSources;
  const ApiInterceptors(
    this._authLocalDataSources,
  );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = _authLocalDataSources.getAccessToken();
    options.headers[ApiKey.token] = token ?? '';
    super.onRequest(options, handler);
  }
}

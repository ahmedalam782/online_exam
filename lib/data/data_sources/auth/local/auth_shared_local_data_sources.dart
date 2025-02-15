import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/local/cache_helper.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:online_exam/data/data_sources/auth/local/auth_local_data_sources.dart';

@Injectable(as: AuthLocalDataSources)
class AuthSharedLocalDataSources implements AuthLocalDataSources {
  final CacheHelper _cacheHelper;

  const AuthSharedLocalDataSources(this._cacheHelper);
  @override
  Future<bool> saveAccessToken(String? token) async {
    return await _cacheHelper.saveData(key: ApiKey.token, value: token);
  }

  @override
  String? getAccessToken() {
    return _cacheHelper.getData(key: ApiKey.token);
  }
}

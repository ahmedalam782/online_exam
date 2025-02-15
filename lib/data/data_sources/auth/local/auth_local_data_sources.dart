abstract class AuthLocalDataSources {
  Future<bool> saveAccessToken(String? token);
  String? getAccessToken();
}

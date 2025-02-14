import 'package:online_exam/core/network/errors/error_model.dart';

class ServerError implements Exception {
  ErrorModel? errorModel;
  ServerError(this.errorModel);
}

class NetworkError implements Exception {
  NetworkError();
}

class ClientError implements Exception {
  ErrorModel? errorModel;
  ClientError(this.errorModel);
}

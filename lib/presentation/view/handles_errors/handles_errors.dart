import 'package:online_exam/core/network/errors/exception.dart';
import 'package:online_exam/core/resources/values_manager.dart';
import 'package:online_exam/domain/common/exceptions/server_error.dart';

String? handleError(Exception? exception) {
  if (exception is ServerException) {
    return exception.errorModel.message;
  } else if (exception is ClientError) {
    return (exception.errorModel?.message);
  } else if (exception is LocalException) {
    return (exception.message);
  } else if (exception is NetworkError) {
    return (AppConstants.offlineFailureMessage);
  }
}
// class Failure {
//   final String message;
//   const Failure({this.message = 'something went wrong'});
// }

import 'package:online_exam/core/network/errors/error_model.dart';

class Failure {
  final ErrorModel? errorModel;
  const Failure({this.errorModel});
}

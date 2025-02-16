import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';

import '../../../entities/auth/sign_in/sign_in_request_entity.dart';
import '../../../entities/auth/sign_in/sign_in_response_entity.dart';

abstract class SignInRepo {
  Future<Result<SignInResponseEntity>> signIn(
      SignInRequestEntity signInRequestEntity);
}

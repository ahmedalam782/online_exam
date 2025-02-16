
import 'package:online_exam/domain/entities/auth/forget_password_request_entity.dart';

import '../../common/result.dart';
import '../../entities/auth/forget_password_response_entity.dart';

abstract class ForgetPasswordRepository{
  Future<Result<ForgetPasswordResponseEntity>> sendEmail(ForgetPasswordRequestEntity forgetPasswordRequestEntity);
}
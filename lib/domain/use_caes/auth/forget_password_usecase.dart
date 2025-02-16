import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entities/auth/forget_password_request_entity.dart';
import 'package:online_exam/domain/repositories/auth/forget_password_repository.dart';

import '../../common/result.dart';
import '../../entities/auth/forget_password_response_entity.dart';

@Injectable()
class ForgetPasswordUseCase{
  final ForgetPasswordRepository _forgetPasswordRepository;
  ForgetPasswordUseCase(this._forgetPasswordRepository);

  Future<Result<ForgetPasswordResponseEntity>> call(ForgetPasswordRequestEntity forgetPasswordRequestEntity ) {
    return _forgetPasswordRepository.sendEmail(ForgetPasswordRequestEntity(forgetPasswordRequestEntity.email));
  }
}
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/domain/entities/auth/sign_in/sign_in_response_entity.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';
import 'package:online_exam/domain/repositories/auth/sign_up/sign_up_repo.dart';

import '../../entities/auth/sign_in/sign_in_request_entity.dart';
import '../../repositories/auth/sign_in/sign_in_repo.dart';

@Injectable()
class SignIn{
  final SignInRepo _signInRepo;

  SignIn(this._signInRepo);

  Future<Result<SignInResponseEntity>> call(
      SignInRequestEntity signInRequestEntity) {
    return _signInRepo.signIn(signInRequestEntity);
  }
}

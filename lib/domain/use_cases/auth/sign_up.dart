import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';
import 'package:online_exam/domain/repositories/auth/sign_up/sign_up_repo.dart';

@Injectable()
class SignUp {
  final SignUpRepo _signUpRepo;

  SignUp(this._signUpRepo);

  Future<Result<SignUpResponseEntity>> call(
      SignUpRequestEntity signUpRequestEntity) {
    return _signUpRepo.signUp(signUpRequestEntity);
  }
}


import '../../../../models/sigin/sign_in_request.dart';
import '../../../../models/sigin/sign_in_response.dart';

abstract class SignInDataSources {
  Future<SignInResponse> signIn(SignInRequest signUpRequest);
}

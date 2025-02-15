import 'package:online_exam/data/models/auth/sign_up_request/sign_up_request.dart';
import 'package:online_exam/data/models/auth/sign_up_response/sign_up_response.dart';

abstract class SignUpDataSources {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);
}

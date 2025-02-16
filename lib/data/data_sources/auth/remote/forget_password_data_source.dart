
import 'package:online_exam/data/models/auth/Request/ForgetPasswordRequest.dart';

import '../../../models/auth/Response/ForgetPasswordResponse.dart';

abstract class ForgetPasswordDataSource{
  Future<ForgetPasswordResponse>sendEmail(ForgetPasswordRequest forgetPasswordRequest);
}


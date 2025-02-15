import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/api_consumer.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:online_exam/data/data_sources/auth/remote/sign_up_data_sources.dart';
import 'package:online_exam/data/models/auth/sign_up_request/sign_up_request.dart';
import 'package:online_exam/data/models/auth/sign_up_response/sign_up_response.dart';

@Injectable(as: SignUpDataSources)
class SignUpDataSourcesImpl implements SignUpDataSources {
  final ApiConsumer _apiConsumer;
  const SignUpDataSourcesImpl(this._apiConsumer);
  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    final response = await _apiConsumer.post(
      EndPoint.register,
      data: signUpRequest.toJson(),
    );
    return SignUpResponse.fromJson(response);
  }
}

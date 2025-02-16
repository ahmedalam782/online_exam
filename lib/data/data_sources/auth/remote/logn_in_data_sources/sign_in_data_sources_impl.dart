import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/api_consumer.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:online_exam/data/data_sources/auth/remote/logn_in_data_sources/sign_in_data_sources.dart';
import '../../../../models/sigin/sign_in_request.dart';
import '../../../../models/sigin/sign_in_response.dart';

@Injectable(as: SignInDataSources)
class SignInDataSourcesImpl implements SignInDataSources {
  final ApiConsumer _apiConsumer;
  const SignInDataSourcesImpl(this._apiConsumer);
  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    final response = await _apiConsumer.post(EndPoint.signIn, data: signInRequest.toJson(),
    );
    return SignInResponse.fromJson(response);
  }
}

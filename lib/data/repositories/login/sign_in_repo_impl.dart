import 'package:injectable/injectable.dart';
import '../../../core/network/network_info.dart';
import '../../../core/network/remote/api_excuter.dart';
import '../../../domain/common/result.dart';
import '../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';
import '../../../domain/entities/auth/sign_in/sign_in_response_entity.dart';
import '../../../domain/repositories/auth/sign_in/sign_in_repo.dart';
import '../../data_sources/auth/local/auth_local_data_sources.dart';
import '../../data_sources/auth/remote/logn_in_data_sources/sign_in_data_sources.dart';

@Injectable(as: SignInRepo)
class SignInRepoImpl implements SignInRepo {
  final SignInDataSources _signInDataSources;
  final AuthLocalDataSources _authLocalDataSources;
  final NetworkInfo networkInfo ;
  const SignInRepoImpl(this._signInDataSources, this._authLocalDataSources, this.networkInfo);

  @override
  Future<Result<SignInResponseEntity>> signIn(SignInRequestEntity signInRequestEntity) {

    return executeApi<SignInResponseEntity>(() async {
      final result = await _signInDataSources.signIn(signInRequestEntity.toModel());
      await _authLocalDataSources.saveAccessToken(result.token);
      return result.toEntity();
    }, networkInfo);
  }
}

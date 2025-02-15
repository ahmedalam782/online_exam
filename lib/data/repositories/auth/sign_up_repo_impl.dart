import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/network_info.dart';
import 'package:online_exam/core/network/remote/api_excuter.dart';
import 'package:online_exam/data/data_sources/auth/local/auth_local_data_sources.dart';
import 'package:online_exam/data/data_sources/auth/remote/sign_up_data_sources.dart';
import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';
import 'package:online_exam/domain/repositories/auth/sign_up/sign_up_repo.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo {
  final SignUpDataSources _signUpDataSources;
  final AuthLocalDataSources _authLocalDataSources;
  final NetworkInfo networkInfo ;
  const SignUpRepoImpl(this._signUpDataSources, this._authLocalDataSources, this.networkInfo);
  @override
  Future<Result<SignUpResponseEntity>> signUp(
      SignUpRequestEntity signUpRequestEntity) {
    return executeApi<SignUpResponseEntity>(() async {
      final result =
          await _signUpDataSources.signUp(signUpRequestEntity.toModel());
      await _authLocalDataSources.saveAccessToken(result.token);
      return result.toEntity();
    }, networkInfo);
  }
}

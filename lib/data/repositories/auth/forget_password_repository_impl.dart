import 'package:injectable/injectable.dart';
import 'package:online_exam/data/data_sources/auth/remote/forget_password_data_source.dart';
import 'package:online_exam/domain/entities/auth/forget_password_request_entity.dart';
import 'package:online_exam/domain/entities/auth/forget_password_response_entity.dart';
import '../../../core/network/network_info.dart';
import '../../../core/network/remote/api_excuter.dart';
import '../../../domain/common/result.dart';
import '../../../domain/repositories/auth/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordDataSource _forgetPasswordDataSource;
  final NetworkInfo networkInfo ;
  const ForgetPasswordRepositoryImpl(this._forgetPasswordDataSource,this.networkInfo);

  @override
  Future<Result<ForgetPasswordResponseEntity>> sendEmail(
      ForgetPasswordRequestEntity forgetPasswordRequestEntity) {
    return executeApi<ForgetPasswordResponseEntity>(() async {
      final result = await _forgetPasswordDataSource.sendEmail(
          forgetPasswordRequestEntity.toModel());
      return result.toEntity();
    }, networkInfo);
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:online_exam/core/di/register_modules.dart' as _i295;
import 'package:online_exam/core/network/local/cache_helper.dart' as _i929;
import 'package:online_exam/core/network/local/shared_preferences_cashed.dart'
    as _i634;
import 'package:online_exam/core/network/network_info.dart' as _i625;
import 'package:online_exam/core/network/remote/api_consumer.dart' as _i955;
import 'package:online_exam/core/network/remote/dio_consumer.dart' as _i858;
import 'package:online_exam/data/data_sources/auth/remote/forget_password_data_source.dart'
    as _i758;
import 'package:online_exam/data/data_sources/auth/remote/forget_password_data_source_impl.dart'
    as _i973;
import 'package:online_exam/data/repositories/auth/forget_password_repository_impl.dart'
    as _i97;
import 'package:online_exam/domain/repositories/auth/forget_password_repository.dart'
    as _i446;
import 'package:online_exam/domain/use_caes/auth/forget_password_usecase.dart'
    as _i593;
import 'package:online_exam/presentation/view_model/cubit/auth/auth_cubit.dart'
    as _i432;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.instance,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i955.ApiConsumer>(() => _i858.DioConsumer(gh<_i361.Dio>()));
    gh.factory<_i758.ForgetPasswordDataSource>(
        () => _i973.ForgetPasswordDataSourceImpl(gh<_i955.ApiConsumer>()));
    gh.singleton<_i929.CacheHelper>(
        () => _i634.SharedPreferencesCashed(gh<_i460.SharedPreferences>()));
    gh.singleton<_i625.NetworkInfo>(
        () => _i625.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.factory<_i446.ForgetPasswordRepository>(
        () => _i97.ForgetPasswordRepositoryImpl(
              gh<_i758.ForgetPasswordDataSource>(),
              gh<_i625.NetworkInfo>(),
            ));
    gh.factory<_i593.ForgetPasswordUseCase>(() =>
        _i593.ForgetPasswordUseCase(gh<_i446.ForgetPasswordRepository>()));
    gh.factory<_i432.AuthCubit>(
        () => _i432.AuthCubit(gh<_i593.ForgetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i295.RegisterModule {}

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
import 'package:online_exam/core/network/remote/api_interceptors.dart' as _i74;
import 'package:online_exam/core/network/remote/dio_consumer.dart' as _i858;
import 'package:online_exam/data/data_sources/auth/local/auth_local_data_sources.dart'
    as _i325;
import 'package:online_exam/data/data_sources/auth/local/auth_shared_local_data_sources.dart'
    as _i906;
import 'package:online_exam/data/data_sources/auth/remote/logn_in_data_sources/sign_in_data_sources.dart'
    as _i856;
import 'package:online_exam/data/data_sources/auth/remote/logn_in_data_sources/sign_in_data_sources_impl.dart'
    as _i601;
import 'package:online_exam/data/data_sources/auth/remote/sign_up_data_sources.dart'
    as _i405;
import 'package:online_exam/data/data_sources/auth/remote/sign_up_data_sources_impl.dart'
    as _i336;
import 'package:online_exam/data/repositories/auth/sign_up_repo_impl.dart'
    as _i600;
import 'package:online_exam/data/repositories/login/sign_in_repo_impl.dart'
    as _i930;
import 'package:online_exam/domain/repositories/auth/sign_in/sign_in_repo.dart'
    as _i731;
import 'package:online_exam/domain/repositories/auth/sign_up/sign_up_repo.dart'
    as _i495;
import 'package:online_exam/domain/use_cases/auth/sign_in.dart' as _i122;
import 'package:online_exam/domain/use_cases/auth/sign_up.dart' as _i751;
import 'package:online_exam/presentation/view_model/cubit/auth/auth_cubit.dart'
    as _i432;
import 'package:online_exam/presentation/view_model/cubit/auth/sign_in/sign_In_cubit.dart'
    as _i571;
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
    gh.factory<_i929.CacheHelper>(
        () => _i634.SharedPreferencesCashed(gh<_i460.SharedPreferences>()));
    gh.singleton<_i625.NetworkInfo>(
        () => _i625.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.factory<_i325.AuthLocalDataSources>(
        () => _i906.AuthSharedLocalDataSources(gh<_i929.CacheHelper>()));
    gh.factory<_i955.ApiConsumer>(() => _i858.DioConsumer(
          gh<_i361.Dio>(),
          gh<_i325.AuthLocalDataSources>(),
        ));
    gh.singleton<_i361.Interceptor>(
        () => _i74.ApiInterceptors(gh<_i325.AuthLocalDataSources>()));
    gh.factory<_i856.SignInDataSources>(
        () => _i601.SignInDataSourcesImpl(gh<_i955.ApiConsumer>()));
    gh.factory<_i405.SignUpDataSources>(
        () => _i336.SignUpDataSourcesImpl(gh<_i955.ApiConsumer>()));
    gh.factory<_i495.SignUpRepo>(() => _i600.SignUpRepoImpl(
          gh<_i405.SignUpDataSources>(),
          gh<_i325.AuthLocalDataSources>(),
          gh<_i625.NetworkInfo>(),
        ));
    gh.factory<_i751.SignUp>(() => _i751.SignUp(gh<_i495.SignUpRepo>()));
    gh.factory<_i731.SignInRepo>(() => _i930.SignInRepoImpl(
          gh<_i856.SignInDataSources>(),
          gh<_i325.AuthLocalDataSources>(),
          gh<_i625.NetworkInfo>(),
        ));
    gh.factory<_i432.AuthCubit>(() => _i432.AuthCubit(gh<_i751.SignUp>()));
    gh.factory<_i122.SignIn>(() => _i122.SignIn(gh<_i731.SignInRepo>()));
    gh.factory<_i571.SignInCubit>(() => _i571.SignInCubit(gh<_i122.SignIn>()));
    return this;
  }
}

class _$RegisterModule extends _i295.RegisterModule {}

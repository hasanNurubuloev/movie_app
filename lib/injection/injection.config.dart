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
import 'package:movie_app/core/app/router/app_router.dart' as _i680;
import 'package:movie_app/core/network/http_client.dart' as _i811;
import 'package:movie_app/features/home/data/data_source/home_data_source.dart'
    as _i868;
import 'package:movie_app/features/home/data/data_source/impl/home_data_source_impl.dart'
    as _i756;
import 'package:movie_app/features/home/data/repository/home_repository_impl.dart'
    as _i637;
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart' as _i602;
import 'package:movie_app/features/home/domain/repository/home_repository.dart'
    as _i485;
import 'package:movie_app/injection/injection_module.dart' as _i677;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i680.AppRouter>(() => _i680.AppRouter());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i811.HttpClient>(() => _i811.HttpClient(gh<_i361.Dio>()));
    gh.factory<_i868.HomeDataSource>(
        () => _i756.HomeDataSourceImpl(gh<_i811.HttpClient>()));
    gh.factory<_i485.HomeRepository>(
        () => _i637.HomeRepositoryImpl(gh<_i868.HomeDataSource>()));
    gh.factory<_i602.HomeBloc>(
        () => _i602.HomeBloc(gh<_i485.HomeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i677.RegisterModule {}

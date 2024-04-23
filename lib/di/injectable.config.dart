// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:songlib/common/home/bloc/home_bloc.dart' as _i6;
import 'package:songlib/data/db/app_database.dart' as _i3;
import 'package:songlib/data/repository/auth_repository.dart' as _i4;
import 'package:songlib/data/repository/db_repository.dart' as _i5;
import 'package:songlib/data/repository/local_storage.dart' as _i9;
import 'package:songlib/di/injectable.dart' as _i10;
import 'package:songlib/selection/selected/bloc/selecting_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i3.AppDatabase>(
      () => registerModule.provideAppDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
    gh.lazySingleton<_i5.DatabaseRepository>(
        () => registerModule.provideDatabaseRepository(gh<_i3.AppDatabase>()));
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.factory<_i7.SelectingBloc>(() => _i7.SelectingBloc());
    await gh.singletonAsync<_i8.SharedPreferences>(
      () => registerModule.localStorage(),
      preResolve: true,
    );
    gh.singleton<_i9.LocalStorage>(
        _i9.LocalStorage(gh<_i8.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}

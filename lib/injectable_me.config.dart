// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mvvm_example/app_module.dart' as _i5;
import 'package:mvvm_example/user.dart' as _i3;
import 'package:mvvm_example/user_view_model.dart' as _i4;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.UserRepository>(
      () => registerModule.userRepository,
      registerFor: {_prod},
    );
    await gh.lazySingletonAsync<_i3.UserRepository>(
      () => registerModule.getUserRepositoryAsync,
      registerFor: {
        _dev,
        _test,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i3.UserRepository>(() => appModule.userRepository);
    gh.factory<_i4.UserViewModel>(
        () => _i4.UserViewModel(gh<_i3.UserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i4.RegisterModule {}

class _$AppModule extends _i5.AppModule {}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/inject_modules.dart' as _i195;
import 'core/toast_hepler.dart' as _i837;
import 'feature/todo/repository/data_source/todo_local_data_source.dart'
    as _i582;
import 'feature/todo/repository/todo_repository.dart' as _i941;
import 'feature/todo/view_model/todo_view_model.dart' as _i962;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i837.ToastHelper>(() => _i837.ToastHelper());
    gh.lazySingleton<_i582.TodoLocalDataSource>(
      () => _i582.TodoLocalDataSourceImpl(prefs: gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i941.TodoRepository>(
      () => _i941.TodoRepositoryImpl(
        localDataSource: gh<_i582.TodoLocalDataSource>(),
      ),
    );
    gh.factory<_i962.TodoViewModel>(
      () => _i962.TodoViewModel(
        repository: gh<_i941.TodoRepository>(),
        toastHepler: gh<_i837.ToastHelper>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i195.RegisterModule {}

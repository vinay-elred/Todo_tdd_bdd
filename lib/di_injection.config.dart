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
import 'feature/theme/repository/data_source/theme_local_data_source.dart'
    as _i804;
import 'feature/theme/repository/theme_repository.dart' as _i1003;
import 'feature/theme/view_model/theme_view_model.dart' as _i23;
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
    gh.lazySingleton<_i804.ThemeLocalDataSource>(
      () =>
          _i804.ThemeLocalDataSourceImpl(prefs: gh<_i460.SharedPreferences>()),
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
    gh.lazySingleton<_i1003.ThemeRepository>(
      () => _i1003.ThemeRepositoryImpl(
        themeLocalDataSource: gh<_i804.ThemeLocalDataSource>(),
      ),
    );
    gh.factory<_i23.ThemeViewModel>(
      () => _i23.ThemeViewModel(
        themeRepository: gh<_i1003.ThemeRepository>(),
        toastHelper: gh<_i837.ToastHelper>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i195.RegisterModule {}

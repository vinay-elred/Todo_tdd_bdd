import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';
import 'package:todo_app/feature/theme/repository/theme_repository.dart';
import 'package:todo_app/feature/theme/view_model/theme_view_model.dart';
import 'package:todo_app/feature/todo/repository/data_source/todo_local_data_source.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';
import 'theme/repository/theme_repository_impl_test.mocks.dart';
import 'todo/repository/mock_todo_local_source.mocks.dart';
import 'todo/view_model/mock_todo_repository.mocks.dart';

Future<void> setupTestDI() async {
  await getIt.reset();
  getIt.registerFactory<TodoViewModel>(
    () => TodoViewModel(repository: getIt(), toastHepler: getIt()),
  );
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(localDataSource: getIt()),
  );
  getIt.registerLazySingleton<ToastHelper>(() => MockMyToastHepler());
  getIt.registerLazySingleton<TodoLocalDataSource>(() => MockTodoLocalSource());

  getIt.registerFactory<ThemeViewModel>(
    () => ThemeViewModel(themeRepository: getIt(), toastHelper: getIt()),
  );
  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(themeLocalDataSource: getIt()),
  );
  getIt.registerLazySingleton<ThemeLocalDataSource>(
    () => MockThemeLocalDataSource(),
  );
}

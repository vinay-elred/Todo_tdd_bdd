import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/todo/repository/data_source/todo_local_data_source.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';
import 'repository/mock_todo_local_source.mocks.dart';
import 'view_model/mock_todo_repository.mocks.dart';

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
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/todo/repository/data_source/todo_local_data_source.dart';

import '../repository/mock_todo_local_source.mocks.dart';
import '../view_model/mock_todo_repository.mocks.dart';

/// Usage: Mock prefs return Todo when added
Future<void> mockPrefsReturnTodoWhenAdded(WidgetTester tester) async {
  final mockToast = getIt<ToastHelper>() as MockMyToastHepler;
  when(mockToast.show(any)).thenAnswer((_) async => true);

  final mocklocalTodo = getIt<TodoLocalDataSource>() as MockTodoLocalSource;
  when(mocklocalTodo.add(any)).thenAnswer((_) async => true);
}

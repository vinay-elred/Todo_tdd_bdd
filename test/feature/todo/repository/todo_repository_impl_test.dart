import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';

import '../../../fixture/fixture.dart';
import 'mock_todo_local_source.mocks.dart';

void main() {
  late MockTodoLocalSource todoLocalSource;
  late TodoRepositoryImpl todoRepositoryImpl;

  setUp(() {
    todoLocalSource = MockTodoLocalSource();
    todoRepositoryImpl = TodoRepositoryImpl(localDataSource: todoLocalSource);
  });

  group("Todo repository", () {
    test("Fetching Todo List with success", () async {
      //assert
      final stringTodo = await loadFixture("todo_list_fixture.json");
      final List decodeJson = jsonDecode(stringTodo);
      final todoList = decodeJson.map((e) => TodoModel.fromJson(e)).toList();
      when(todoLocalSource.fetch()).thenAnswer((_) async => todoList);
      //act
      final response = await todoRepositoryImpl.fetch();
      //verify
      verify(todoLocalSource.fetch());
      expect(response, Right(todoList));
      verifyZeroInteractions(todoLocalSource);
    });
  });
}

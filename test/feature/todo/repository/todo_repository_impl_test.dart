import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/exception.dart';
import 'package:todo_app/core/failure.dart';
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
      verifyNoMoreInteractions(todoLocalSource);
    });

    test("Fetching Todo List with failure", () async {
      //assert
      when(todoLocalSource.fetch()).thenThrow(CacheException());
      //act
      final response = await todoRepositoryImpl.fetch();
      //verify
      verify(todoLocalSource.fetch());
      expect(response, Left(CacheFailure()));
      verifyNoMoreInteractions(todoLocalSource);
    });

    test("Add Todo with success", () async {
      //assert
      when(todoLocalSource.add(any)).thenAnswer((_) async => true);
      //act
      final todo = TodoModel(id: "0", todo: "Test todo", isCompleted: false);
      final response = await todoRepositoryImpl.add(todo);
      //verify
      verify(todoLocalSource.add(any));
      expect(response, Right(unit));
      verifyNoMoreInteractions(todoLocalSource);
    });

    test("Add Todo with failure", () async {
      //assert
      when(todoLocalSource.add(any)).thenThrow(CacheException());
      //act
      final todo = TodoModel(id: "0", todo: "Test todo", isCompleted: false);
      final response = await todoRepositoryImpl.add(todo);
      //verify
      verify(todoLocalSource.add(any));
      expect(response, Left(CacheFailure()));
      verifyNoMoreInteractions(todoLocalSource);
    });
  });
}

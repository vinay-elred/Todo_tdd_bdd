import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';

import '../../../fixture/fixture.dart';
import 'mock_todo_repository.mocks.dart';

void main() {
  late MockTodoRepo mockTodoRepo;
  late TodoViewModel todoViewModel;

  setUp(() {
    mockTodoRepo = MockTodoRepo();
    todoViewModel = TodoViewModel(repository: mockTodoRepo);
  });

  group("Todo ViewModel", () {
    test("fetch Todos retuen success", () async {
      //assert
      final stringTodo = await loadFixture("todo_list_fixture.json");
      final List decodeJson = jsonDecode(stringTodo);
      final todos = decodeJson.map((e) => TodoModel.fromJson(e)).toList();
      when(mockTodoRepo.fetch()).thenAnswer((_) async => Right(todos));
      //act
      await todoViewModel.fetch();
      //verify
      expect(todoViewModel.todos, todos);
      verify(mockTodoRepo.fetch());
      verifyNoMoreInteractions(mockTodoRepo);
    });

    test("fetch Todos retuen failure", () async {
      //assert
      when(mockTodoRepo.fetch()).thenAnswer((_) async => Left(CacheFailure()));
      //act
      await todoViewModel.fetch();
      //verify
      expect(todoViewModel.todos.length, 0);
      verify(mockTodoRepo.fetch());
      verifyNoMoreInteractions(mockTodoRepo);
    });
  });
}

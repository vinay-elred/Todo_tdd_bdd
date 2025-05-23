import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/repository/data_source/todo_local_data_source.dart';

import '../../../../core/prefs/mock_prefs.mocks.dart';
import '../../../../fixture/fixture.dart';

void main() {
  late MockPrefs mockPrefs;
  late TodoLocalDataSourceImpl todoLocalDataSourceImpl;

  setUp(() {
    mockPrefs = MockPrefs();
    todoLocalDataSourceImpl = TodoLocalDataSourceImpl(prefs: mockPrefs);
  });

  group("Todo Local Source", () {
    test("Fetch local data return success", () async {
      //assert
      final stringTodo = await loadFixture("todo_list_fixture.json");
      when(mockPrefs.getString(any)).thenReturn(stringTodo);
      //act
      final response = await todoLocalDataSourceImpl.fetch();
      //verify
      final List decodeJson = jsonDecode(stringTodo);
      final expected = decodeJson.map((e) => TodoModel.fromJson(e)).toList();
      expect(response, expected);
      verify(mockPrefs.getString(any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Fetch local data return failure", () async {
      //assert
      when(mockPrefs.getString(any)).thenThrow(Exception());
      //act
      final call = todoLocalDataSourceImpl.fetch();
      //verify
      expect(() async => await call, throwsException);
      verify(mockPrefs.getString(any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Add todo return success", () async {
      //assert
      when(mockPrefs.getString(TODO_PREFS_KEY)).thenReturn(null);
      when(
        mockPrefs.setString(TODO_PREFS_KEY, any),
      ).thenAnswer((_) async => true);
      //act
      TodoModel todo = TodoModel(
        id: "0",
        todo: "Test todo",
        isCompleted: false,
      );
      final response = await todoLocalDataSourceImpl.add(todo);
      //verify
      expect(response, true);
      verify(mockPrefs.getString(any));
      verify(mockPrefs.setString(any, any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Add todo return failure", () async {
      //assert
      when(mockPrefs.getString(TODO_PREFS_KEY)).thenReturn(null);
      when(
        mockPrefs.setString(TODO_PREFS_KEY, any),
      ).thenThrow(Exception());
      //act
      TodoModel todo = TodoModel(
        id: "0",
        todo: "Test todo",
        isCompleted: false,
      );
      final call =  todoLocalDataSourceImpl.add(todo);
      //verify
      expect(() async => await call, throwsException);
      verify(mockPrefs.getString(any));
      verify(mockPrefs.setString(any, any));
      verifyNoMoreInteractions(mockPrefs);
    });
  });
}

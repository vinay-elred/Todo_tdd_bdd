import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';

import '../../../fixture/fixture.dart';

void main() {
  group("Todo-Model", () {
    test("Todo Model from json", () async {
      //assert
      TodoModel expected = TodoModel(
        id: "0",
        todo: "Test todo",
        completed: false,
      );
      //act
      final stringTodo = await loadFixture("todo_fixture.json");
      final Map<String, dynamic> decodeJson = jsonDecode(stringTodo);
      final actual = TodoModel.fromJson(decodeJson);
      //verify
      expect(actual, expected);
    });
  });
}

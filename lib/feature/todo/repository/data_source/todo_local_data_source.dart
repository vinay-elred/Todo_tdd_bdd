import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetch();
  Future<bool> add(TodoModel todo);
}

// ignore: constant_identifier_names
const String TODO_PREFS_KEY = "TODO_PREFS_KEY";

@LazySingleton(as: TodoLocalDataSource)
class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences prefs;
  const TodoLocalDataSourceImpl({required this.prefs});

  @override
  Future<bool> add(TodoModel todo) async {
    final todoListString = prefs.getString(TODO_PREFS_KEY) ?? "[]";
    final List decodedJson = jsonDecode(todoListString);
    final newTodo = jsonEncode(todo.toMap());
    final updatedList = [newTodo, ...decodedJson];
    final success = await prefs.setString(
      TODO_PREFS_KEY,
      jsonEncode(updatedList),
    );
    return success;
  }

  @override
  Future<List<TodoModel>> fetch() async {
    final todoListString = prefs.getString(TODO_PREFS_KEY) ?? "[]";
    final List decodedJson = jsonDecode(todoListString);
    final todos =
        decodedJson.map((e) => TodoModel.fromJson(jsonDecode(e))).toList();
    return todos;
  }
}

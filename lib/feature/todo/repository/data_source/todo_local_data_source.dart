import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetch();
  Future<bool> add(TodoModel todo);
}

// ignore: constant_identifier_names
const String TODO_PREFS_KEY = "TODO_PREFS_KEY";

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences prefs;
  const TodoLocalDataSourceImpl({required this.prefs});

  @override
  Future<bool> add(TodoModel todo) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> fetch() async {
    final todoListString = prefs.getString(TODO_PREFS_KEY) ?? "[]";
    final List decodedJson = jsonDecode(todoListString);
    final todos = decodedJson.map((e) => TodoModel.fromJson(e)).toList();
    return todos;
  }
}

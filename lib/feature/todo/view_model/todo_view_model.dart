import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository repository;
  TodoViewModel({required this.repository});

  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  Future<void> fetch() async {}

  Future<void> add(TodoModel todo) async {}
}

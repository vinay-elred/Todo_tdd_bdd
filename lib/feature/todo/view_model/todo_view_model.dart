import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';

@injectable
class TodoViewModel extends ChangeNotifier {
  final TodoRepository repository;
  final ToastHelper toastHepler;
  TodoViewModel({required this.repository, required this.toastHepler});

  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  bool _initialLoading = false;
  bool get initialLoading => _initialLoading;

  Future<void> fetch() async {
    _initialLoading = true;
    final response = await repository.fetch();
    response.fold(
      (failure) {
        toastHepler.show("Fetch failed $failure");
        log("Fetch failed $failure");
      },
      (todos) {
        return _todos = [...todos];
      },
    );
    _initialLoading = false;
    notifyListeners();
  }

  Future<void> add(TodoModel todo) async {
    final response = await repository.add(todo);
    response.fold(
      (failure) {
        toastHepler.show("Add failed $failure");
        log("Add failed $failure");
      },
      (unit) {
        return _todos = [todo, ...todos];
      },
    );
    notifyListeners();
  }
}

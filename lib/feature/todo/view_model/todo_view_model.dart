import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository localRepository;
  TodoViewModel({required this.localRepository});
}

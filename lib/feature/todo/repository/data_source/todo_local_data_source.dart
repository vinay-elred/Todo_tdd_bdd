import 'package:todo_app/feature/todo/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetch();
  Future<bool> add(TodoModel todo);
}

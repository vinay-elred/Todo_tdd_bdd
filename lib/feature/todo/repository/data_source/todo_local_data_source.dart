import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetch();
  Future<bool> add(TodoModel todo);
}

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
  Future<List<TodoModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}

import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  const TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
  });
  final String id;
  final bool completed;
  final String todo;

  @override
  List<Object?> get props => [id, todo, completed];

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"] as String,
      todo: json["todo"] as String,
      completed: json["isCompleted"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": "0", "todo": "Test todo", "isCompleted": false};
  }
}

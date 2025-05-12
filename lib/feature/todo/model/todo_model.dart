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
    return TodoModel(id: "0", todo: "Test todo", completed: false);
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

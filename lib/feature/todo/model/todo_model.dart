import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  const TodoModel({
    required this.id,
    required this.todo,
    required this.isCompleted,
  });
  final String id;
  final bool isCompleted;
  final String todo;

  @override
  List<Object?> get props => [id, todo, isCompleted];

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"] as String,
      todo: json["todo"] as String,
      isCompleted: json["isCompleted"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "todo": todo, "isCompleted": isCompleted};
  }
}

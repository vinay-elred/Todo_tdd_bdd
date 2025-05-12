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
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

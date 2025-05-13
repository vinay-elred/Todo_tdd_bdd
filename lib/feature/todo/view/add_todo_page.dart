import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add todo")),
      body: Column(
        children: [
          TextField(
            controller: todoController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () async {
              final todo = TodoModel(
                id: todoController.hashCode.toString(),
                todo: todoController.text.trim(),
                isCompleted: false,
              );
              context.read<TodoViewModel>().add(todo);
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/todo/view/todos_page.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<TodoViewModel>(),
      child: const MaterialApp(home: TodosPage()),
    );
  }
}

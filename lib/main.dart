import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/theme/view_model/theme_view_model.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<TodoViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeViewModel>()),
      ],
      builder: (context, child) {
        return StreamBuilder(
          stream: context.read<ThemeViewModel>().themeStream,
          builder: (context, snapshot) {
            return MaterialApp(
              themeMode: snapshot.data,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: TodosPage(),
            );
          },
        );
      },
    );
  }
}

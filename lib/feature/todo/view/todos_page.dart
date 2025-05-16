import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/feature/theme/view/theme_page.dart';
import 'package:todo_app/feature/theme/view_model/theme_view_model.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:todo_app/feature/todo/view/add_todo_page.dart';
import 'package:todo_app/feature/todo/view_model/todo_view_model.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoViewModel>().fetch();
    context.read<ThemeViewModel>().getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ThemePage()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Center buildBody() {
    return Center(
      child: Selector<TodoViewModel, ({bool loading, List<TodoModel> todos})>(
        builder: (context, value, child) {
          if (value.loading) return CircularProgressIndicator();
          if (value.todos.isEmpty) {
            return Text("No Todo Yet!", style: TextStyle(fontSize: 20));
          }
          return ListView.separated(
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return Text(
                value.todos[index].todo,
                style: TextStyle(fontSize: 24),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: value.todos.length,
          );
        },
        selector: (p0, p1) => (loading: p1.initialLoading, todos: p1.todos),
      ),
    );
  }
}

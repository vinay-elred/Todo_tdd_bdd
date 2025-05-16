import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/string_extension.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/view_model/theme_view_model.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: StreamBuilder<ThemeMode>(
        stream: context.read<ThemeViewModel>().themeStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final selectedTheme = snapshot.data;
          return ListView.separated(
            itemBuilder: (context, index) {
              final themeModel = ThemeModel(Themes.values[index]);
              final isSelcted = selectedTheme == themeModel.toThemeMode();
              return ListTile(
                onTap: () {
                  context.read<ThemeViewModel>().changeTheme(themeModel);
                },
                leading: isSelcted ? Icon(Icons.check) : null,
                title: Text(themeModel.theme.name.capFirst),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: Themes.values.length,
          );
        },
      ),
    );
  }
}

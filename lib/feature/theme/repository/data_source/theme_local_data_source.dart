import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeModel> getTheme();
  Future<void> setTheme(ThemeModel theme);
}

// ignore: constant_identifier_names
const String THEME_PREFS_KEY = "THEME_PREFS_KEY";

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferences prefs;
  const ThemeLocalDataSourceImpl({required this.prefs});

  @override
  Future<ThemeModel> getTheme() async {
    final themeString = prefs.getString(THEME_PREFS_KEY) ?? "{}";
    final decodeJson = jsonDecode(themeString);
    final theme = ThemeModel.fromJson(decodeJson);
    return theme;
  }

  @override
  Future<void> setTheme(ThemeModel theme) {
    // TODO: implement setTheme
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/exception.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeModel> getTheme();
  Future<void> setTheme(ThemeModel theme);
}

// ignore: constant_identifier_names
const String THEME_PREFS_KEY = "THEME_PREFS_KEY";

@LazySingleton(as: ThemeLocalDataSource)
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
  Future<void> setTheme(ThemeModel theme) async {
    final themeString = jsonEncode(theme.toMap());
    final success = await prefs.setString(THEME_PREFS_KEY, themeString);
    if (!success) throw CacheException();
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeModel> getTheme();
  Future<void> setTheme(ThemeModel theme);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferences prefs;
  const ThemeLocalDataSourceImpl({required this.prefs});

  @override
  Future<ThemeModel> getTheme() {
    // TODO: implement getTheme
    throw UnimplementedError();
  }

  @override
  Future<void> setTheme(ThemeModel theme) {
    // TODO: implement setTheme
    throw UnimplementedError();
  }
}

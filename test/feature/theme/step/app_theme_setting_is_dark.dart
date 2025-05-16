import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';

import '../repository/theme_repository_impl_test.mocks.dart';

/// Usage: App Theme setting is Dark
Future<void> appThemeSettingIsDark(WidgetTester tester) async {
  final mockThemeSource =
      getIt<ThemeLocalDataSource>() as MockThemeLocalDataSource;

  when(
    mockThemeSource.getTheme(),
  ).thenAnswer((_) async => ThemeModel(Themes.dark));
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/di_injection.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';

import '../../test_di.dart';
import '../../todo/view_model/mock_todo_repository.mocks.dart';
import '../repository/theme_repository_impl_test.mocks.dart';

/// Usage: The setup Test DI
Future<void> theSetupTestDi(WidgetTester tester) async {
  await setupTestDI();
  final mockThemeSource =
      getIt<ThemeLocalDataSource>() as MockThemeLocalDataSource;

  when(
    mockThemeSource.getTheme(),
  ).thenAnswer((_) async => ThemeModel(Themes.system));
  final toastMock = getIt<ToastHelper>() as MockMyToastHepler;
  when(toastMock.cancel()).thenAnswer((_) async => true);
  when(toastMock.show(any)).thenAnswer((_) async => true);
}

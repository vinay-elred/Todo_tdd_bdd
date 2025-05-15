import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';
import 'package:todo_app/feature/theme/repository/theme_repository.dart';

import 'theme_repository_impl_test.mocks.dart';

@GenerateMocks([ThemeLocalDataSource])
void main() {
  late ThemeLocalDataSource mockLocalDataSource;
  late ThemeRepositoryImpl themeRepositoryImpl;

  setUp(() {
    mockLocalDataSource = MockThemeLocalDataSource();
    themeRepositoryImpl = ThemeRepositoryImpl(
      themeLocalDataSource: mockLocalDataSource,
    );
  });

  group("Theme Repository", () {
    test("Fetch Theme returns Theme Model", () async {
      //arrange
      final expected = ThemeModel(Theme.dark);
      when(mockLocalDataSource.getTheme()).thenAnswer((_) async => expected);
      //act
      final response = await themeRepositoryImpl.getTheme();
      //verify
      expect(response, Right(expected));
      verify(mockLocalDataSource.getTheme());
    });
  });
}

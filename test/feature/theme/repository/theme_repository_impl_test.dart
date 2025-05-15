import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/exception.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';
import 'package:todo_app/feature/theme/repository/theme_repository.dart';

import 'theme_repository_impl_test.mocks.dart';

@GenerateMocks([ThemeLocalDataSource])
void main() {
  late MockThemeLocalDataSource mockLocalDataSource;
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

    test("Fetch Theme throw cache expection", () async {
      //arrange
      when(mockLocalDataSource.getTheme()).thenThrow(CacheException());
      //act
      final response = await themeRepositoryImpl.getTheme();
      //verify
      expect(response, Left(CacheFailure()));
      verify(mockLocalDataSource.getTheme());
    });

    test("Set Theme return success", () async {
      //arrange
      when(mockLocalDataSource.setTheme(any)).thenAnswer((_) async => unit);
      //act
      final response = await themeRepositoryImpl.setTheme(
        ThemeModel(Theme.dark),
      );
      //verify
      expect(response, Right(unit));
    });
  });
}

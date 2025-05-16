import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/theme_repository.dart';
import 'package:todo_app/feature/theme/view_model/theme_view_model.dart';

import '../../todo/view_model/mock_todo_repository.mocks.dart';
import 'theme_view_model_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late MockThemeRepository mockThemeRepository;
  late MockMyToastHepler toastHepler;
  late ThemeViewModel themeViewModel;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    toastHepler = MockMyToastHepler();
    themeViewModel = ThemeViewModel(
      themeRepository: mockThemeRepository,
      toastHelper: toastHepler,
    );
    when(toastHepler.cancel()).thenAnswer((_) async => true);
    when(toastHepler.show(any)).thenAnswer((_) async => true);
  });

  group("Theme View Model", () {
    test("Fetch initial Theme return System theme", () async {
      //arrange
      when(
        mockThemeRepository.getTheme(),
      ).thenAnswer((answer) async => Right(ThemeModel(Themes.system)));
      //act
      await themeViewModel.getTheme();
      //verify
      expect(themeViewModel.themeStream, emitsInOrder([ThemeMode.system]));
      verify(mockThemeRepository.getTheme());
    });

    test("Fetch initial Theme return Dark theme", () async {
      //arrange
      when(
        mockThemeRepository.getTheme(),
      ).thenAnswer((answer) async => Right(ThemeModel(Themes.dark)));
      //act
      await themeViewModel.getTheme();
      //verify
      expect(themeViewModel.themeStream, emitsInOrder([ThemeMode.dark]));
      verify(mockThemeRepository.getTheme());
    });

    test("Fetch initial Theme return failure", () async {
      //arrange
      when(
        mockThemeRepository.getTheme(),
      ).thenAnswer((answer) async => Left(CacheFailure()));
      //act
      await themeViewModel.getTheme();
      //verify
      expect(themeViewModel.themeStream, emitsInOrder([ThemeMode.system]));
      verify(mockThemeRepository.getTheme());
    });
  });
}

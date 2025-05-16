import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/exception.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/data_source/theme_local_data_source.dart';

import '../../../../core/prefs/mock_prefs.mocks.dart';
import '../../../../fixture/fixture.dart';

void main() {
  late MockPrefs prefs;
  late ThemeLocalDataSourceImpl localDataSourceImpl;

  setUp(() {
    prefs = MockPrefs();
    localDataSourceImpl = ThemeLocalDataSourceImpl(prefs: prefs);
  });

  group("Theme Local Data source", () {
    test("Get Theme from fetch() return ThemeModel", () async {
      //arrange
      final stringTheme = await loadFixture("theme_dark_fixture.json");
      when(prefs.getString(THEME_PREFS_KEY)).thenReturn(stringTheme);
      //act
      final response = await localDataSourceImpl.getTheme();
      //verify
      final Map<String, dynamic> decodeJson = jsonDecode(stringTheme);
      final expected = ThemeModel.fromJson(decodeJson);
      expect(response, expected);
      verify(prefs.getString(any));
    });

    test("Get Theme from fetch() throw Exception", () async {
      //arrange
      when(prefs.getString(THEME_PREFS_KEY)).thenThrow(Exception());
      //act
      final call = localDataSourceImpl.getTheme();
      //verify
      expect(() async => await call, throwsException);
      verify(prefs.getString(any));
    });

    test("Set Theme to prefs with success", () async {
      //arrange
      when(prefs.setString(THEME_PREFS_KEY, any)).thenAnswer((_) async => true);
      //act
      await localDataSourceImpl.setTheme(ThemeModel(Themes.dark));
      //verify
      verify(prefs.setString(any, any));
    });

    test("Set Theme to prefs with Exception", () async {
      //arrange
      when(
        prefs.setString(THEME_PREFS_KEY, any),
      ).thenAnswer((_) async => false);
      //act
      final call = localDataSourceImpl.setTheme(ThemeModel(Themes.dark));
      //verify
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(prefs.setString(any, any));
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';

import '../../../fixture/fixture.dart';

void main() {
  group("Theme Model", () {
    test("Theme Model from json when Theme.Light", () async {
      //arrange
      final expected = ThemeModel(Theme.light);
      //act
      final stringTheme = await loadFixture("theme_light_fixture.json");
      final Map<String, dynamic> decodeJson = jsonDecode(stringTheme);
      final actual = ThemeModel.fromJson(decodeJson);
      //verify
      expect(actual, expected);
    });

    test("Theme Model from json when Theme.dark", () async {
      //arrange
      final expected = ThemeModel(Theme.dark);
      //act
      final stringTheme = await loadFixture("theme_dark_fixture.json");
      final Map<String, dynamic> decodeJson = jsonDecode(stringTheme);
      final actual = ThemeModel.fromJson(decodeJson);
      //verify
      expect(actual, expected);
    });

    test("Theme Model from json when Theme.system", () async {
      //arrange
      final expected = ThemeModel(Theme.system);
      //act
      final stringTheme = await loadFixture("theme_system_fixture.json");
      final Map<String, dynamic> decodeJson = jsonDecode(stringTheme);
      final actual = ThemeModel.fromJson(decodeJson);
      //verify
      expect(actual, expected);
    });

    test("Theme Model from json when Theme.system when json failed", () async {
      //arrange
      final expected = ThemeModel(Theme.system);
      //act
      final Map<String, dynamic> decodeJson = {};
      final actual = ThemeModel.fromJson(decodeJson);
      //verify
      expect(actual, expected);
    });

    test("Theme Model to map", () async {
      //arrange
      final stringTheme = await loadFixture("theme_system_fixture.json");
      final Map<String, dynamic> expected = jsonDecode(stringTheme);
      //act
      final actual = ThemeModel(Theme.system).toMap();
      //verify
      expect(actual, expected);
    });
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_setup_test_di.dart';
import './step/the_app_is_running.dart';
import './step/i_tap_icon.dart';
import './step/i_see_on.dart';
import './step/app_theme_setting_is_system.dart';
import './step/i_tap_text.dart';
import './step/app_theme_setting_is_dark.dart';

void main() {
  group('''Theme''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theSetupTestDi(tester);
    }

    testWidgets('''Default Theme will system setting''', (tester) async {
      await bddSetUp(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.settings);
      await iSeeOn(tester, Icons.check, "System");
    });
    testWidgets('''User changed System Theme to Dark''', (tester) async {
      await bddSetUp(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.settings);
      await iTapText(tester, "Dark");
      await iSeeOn(tester, Icons.check, "Dark");
    });
    testWidgets('''User changed System Theme to Light''', (tester) async {
      await bddSetUp(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.settings);
      await iTapText(tester, "Light");
      await iSeeOn(tester, Icons.check, "Light");
    });
    testWidgets('''User changed Dark Theme to System''', (tester) async {
      await bddSetUp(tester);
      await appThemeSettingIsDark(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.settings);
      await iTapText(tester, "System");
      await iSeeOn(tester, Icons.check, "System");
    });
  });
}

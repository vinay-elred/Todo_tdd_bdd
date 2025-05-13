// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/mock_prefs_empty_todos_list.dart';
import './step/the_app_is_running.dart';
import './step/i_see_text.dart';
import './step/i_tap_icon.dart';
import './step/mock_prefs_return_todo_when_added.dart';
import './step/i_enter_in_textfield.dart';
import './step/i_tap_text.dart';
import 'test_di.dart';

void main() {
  group('''Todo''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await setupTestDI();
    }

    testWidgets('''When Todo list is empty''', (tester) async {
      await bddSetUp(tester);
      await mockPrefsEmptyTodosList(tester);
      await theAppIsRunning(tester);
      await iSeeText(tester, "No Todo Yet!");
    });
    testWidgets('''When I tap Add Todo''', (tester) async {
      await bddSetUp(tester);
      await mockPrefsEmptyTodosList(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, "Add todo");
    });
    testWidgets('''When I Added a new Todo''', (tester) async {
      await bddSetUp(tester);
      await mockPrefsReturnTodoWhenAdded(tester);
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.add);
      await iEnterInTextfield(tester, "Test todo");
      await iTapText(tester, "Save");
      await iSeeText(tester, "Todos");
      await iSeeText(tester, "Test todo");
    });
  });
}

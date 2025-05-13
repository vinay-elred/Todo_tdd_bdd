import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I enter {"Test todo"} in textfield
Future<void> iEnterInTextfield(WidgetTester tester, String param1) async {
  final field = find.byType(TextField).at(0);
  await tester.enterText(field, param1);
  await tester.pumpAndSettle();
}

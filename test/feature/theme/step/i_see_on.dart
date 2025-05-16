import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {Icons.check} on {"System"}
Future<void> iSeeOn(
  WidgetTester tester,
  IconData icon,
  String themeName,
) async {
  final listTileFinder = find.byWidgetPredicate(
    (widget) =>
        widget is ListTile && widget.leading is Icon && widget.title is Text,
  );

  expect(
    listTileFinder,
    findsOneWidget,
    reason: 'Expected one ListTile with specified icon and text',
  );

  final listTile = tester.widget<ListTile>(listTileFinder);

  expect((listTile.leading as Icon).icon, icon);
  expect((listTile.title as Text).data, themeName);
}

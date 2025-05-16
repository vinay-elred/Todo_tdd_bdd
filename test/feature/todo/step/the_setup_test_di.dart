import 'package:flutter_test/flutter_test.dart';

import '../../test_di.dart';

/// Usage: The setup Test DI
Future<void> theSetupTestDi(WidgetTester tester) async {
  await setupTestDI();
}

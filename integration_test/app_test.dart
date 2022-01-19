import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Create task'), findsOneWidget);
      final Finder fab = find.text('Create task');
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('All task'), findsNothing);
    });
  });
}

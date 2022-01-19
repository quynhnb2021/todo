import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/all_task_page/views/all_task_page_view.dart';

Widget createAllTaskScreen() => MaterialApp(
      home: AllTaskPage(title: "All", nameTask: "Create task"),
    );

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  Get.put(AllTaskPageController());

  group('All Page  Task Widget Tests', () {
    testWidgets('MyWidget has an “Create task” UI',
        (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(createAllTaskScreen());

      // Create the Finders.
      final titleFinder = find.text('All');
      final messageFinder = find.text('Create task');

      // Use the `findsOneWidget` matcher provided by flutter_test to
      // verify that the Text widgets appear exactly once in the widget tree.
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });
    testWidgets('Testing if Container shows up', (tester) async {
      await tester.pumpWidget(createAllTaskScreen());
      expect(find.byType(Container), findsOneWidget);
    });
  });
}

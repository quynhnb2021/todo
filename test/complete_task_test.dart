import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/complete_task_page/views/complete_task_page_view.dart';

Widget createCompleteTaskScreen() => MaterialApp(
      home: CompleteTaskPage(
          title: "Complete",
          description: 'No data, please create the task new'),
    );

void main() {
  Get.lazyPut(() => AllTaskPageController());
  Get.put(CompleteTaskPageController());

  group('All Page  Task Widget Tests', () {
    testWidgets('MyWidget have Title and Decription',
        (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(createCompleteTaskScreen());

      // Create the Finders.
      final titleFinder = find.text('Complete');
      final messageFinder = find.text('No data, please create the task new');

      // Use the `findsOneWidget` matcher provided by flutter_test to
      // verify that the Text widgets appear exactly once in the widget tree.
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });
    testWidgets('Testing if Container shows up', (tester) async {
      await tester.pumpWidget(createCompleteTaskScreen());
      expect(find.byType(Container), findsWidgets);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/all_task_page/views/all_task_page_view.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/views/incomplete_task_page_view.dart';

Widget createTaskPopup() => MaterialApp(
      home: TextFieldAlertDialog(
        title: "Create task",
        titleButton: "SUBMIT",
        hintText: "Wrire task here ...",
        toast: "Please fill task above",
      ),
    );

void main() {
  Get.lazyPut(() => AllTaskPageController());
  Get.put(IncompleteTaskPageController());
  Get.put(CompleteTaskPageController());

  group('All Page Task Widget Tests', () {
    testWidgets('MyWidget has a Title, hintText and toast',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTaskPopup());
      expect(find.text('Hello'), findsNothing);
      expect(find.text('Create task'), findsOneWidget);
      expect(find.text('SUBMIT'), findsOneWidget);
      expect(find.text('Wrire task here ...'), findsOneWidget);
      expect(find.text('Please fill task above'), findsNothing);
    });
    testWidgets('Testing if AlertDialog shows up', (tester) async {
      await tester.pumpWidget(createTaskPopup());
      expect(find.byType(AlertDialog), findsWidgets);
    });

    testWidgets('Testing tap TextButton', (tester) async {
      await tester.pumpWidget(createTaskPopup());
      expect(find.byIcon(Icons.lock), findsNothing);
      await tester.tap(find.byType(Text).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('SUBMIT'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Please fill task above'), findsNothing);
      expect(find.byIcon(Icons.lock), findsNothing);
    });
    testWidgets('Test enter text', (WidgetTester tester) async {
      await tester.pumpWidget(createTaskPopup());
      await tester.enterText(find.byType(TextField), 'hi');
      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(find.text('hi'), findsOneWidget);
      // await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('hi'), findsNothing);
    });
  });
}

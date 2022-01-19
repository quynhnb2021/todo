// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';
import 'package:todo/app/modules/main/controllers/main_controller.dart';
import 'package:todo/app/modules/main/views/main_view.dart';

import 'package:todo/main.dart';

Widget createMainScreen() => MaterialApp(
      home: MainView(),
    );

void main() {
  Get.put(AllTaskPageController());
  Get.put(IncompleteTaskPageController());
  Get.put(CompleteTaskPageController());
  Get.lazyPut<MainController>(
    () => MainController(),
  );
  testWidgets('Test widget main', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createMainScreen());

    // Verify that our counter starts at 0.
    expect(find.text('All'), findsWidgets);
    expect(find.text('Complete'), findsOneWidget);
    expect(find.text('InComplete'), findsNothing);
    // expect(find.byWidget(), findsOneWidget);
    await tester.tap(find.text('All'));
    await tester.tap(find.text('Complete'));
    await tester.tap(find.text('Incomplete'));
    await tester.pump();
  });
}
